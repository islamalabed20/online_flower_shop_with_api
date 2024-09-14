import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_flower_shop_auth/model/user_info.dart';

class SettingsService extends GetxService {
  static final GetStorage _getStorage = GetStorage();
  Timer? _timer;
  static Future<SettingsService> init() async {
    await _getStorage.initStorage;
    return SettingsService();
  }

  late final UserInfo _userInfo;

  SettingsService() {
    _getStorage.writeIfNull('access_token', null);
    _getStorage.writeIfNull('is_logged_in', null);
    _userInfo = UserInfo.fromMap(
      Map<String, dynamic>.from(
        {
          'access_token': _getStorage.read('access_token'),
          'is_logged_in': _getStorage.read('is_logged_in'),
        },
      ),
    );
  }

  void setToken({
    required String newToken,
  }) {
    _userInfo.token = newToken;
  }

  String getToken() {
    return _userInfo.token;
  }

  void setLoginState({
    required bool isLoggedIn,
  }) {
    _userInfo.isLoggedIn = isLoggedIn;
  }

  void startTokenExpiryTimer(int expiresIn) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: expiresIn), () {
      logout(); // Auto logout when token expires
    });
  }

  bool isLoggedIn() {
    return _userInfo.isLoggedIn;
  }

  void logout() {
    _getStorage.write('token', null);
    _getStorage.write('is_logged_in', null);
    _userInfo.clearData();
  }

  void printInfo() {
    debugPrint(_userInfo.toString());
  }
}
