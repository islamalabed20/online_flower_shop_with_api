import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_flower_shop_auth/core/utility/dio_request.dart';
import 'package:online_flower_shop_auth/core/widget/error_dialog.dart';
import 'package:online_flower_shop_auth/core/widget/loading_dialog.dart';

class AuthenticationController extends GetxController {
  final globalKey = GlobalKey<FormState>();
  final codeController = TextEditingController();

  final storage = GetStorage();
  String? Function(String?)? validator;
  RxBool timerDone = false.obs;
  RxString timerString = "03:00".obs;
  Timer? _timer;

  void assignValidator({
    bool isApiRequest = false,
  }) {
    validator = (String? value) {
      if (value == null || value.isEmpty) {
        return "Please enter the code.";
      } else if (value.length != 6) {
        return "Please enter all 6 characters.";
      } else if (isApiRequest) {
        return "Verification code is invalid or has expired";
      }
      return null;
    };
    update();
  }

  void clearValidator() {
    validator = (String? value) {
      return null;
    };
    update();
  }

  void startTokenExpiryTimer(int expiresIn) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: expiresIn), () {
      logout(istokenExpired: true);
    });
  }

  Future<bool> validateInput() async {
    final String email = Get.arguments['email'];
    String verificationType = Get.arguments['verificationType'];
    LoadingDialog.showDialog();
    Response? response;
    try {
      if (verificationType == 'login') {
        response = await DioRequests.request2FA(
          email: email,
          code: codeController.value.text,
        );
        Get.back();
        if (response == null) {
          ErrorDialog.showDialog();
          throw Exception("response is null");
        } else {
          final data = response.data;
          switch (response.statusCode) {
            case 200:
              String token = response.data['access_token'];
              storage.write('access_token', token);
              storage.write('expires_in', data['expires_in']);
              startTokenExpiryTimer(data['expires_in']);
              return true;
            case 403:
              Get.snackbar(
                "Forbidden",
                "Your account is already verified. Please try logging in.",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.orange,
                colorText: Colors.white,
              );
              return false;

            case 404:
              Get.snackbar(
                "Not Found",
                "This email has no user associated. Try registering first.",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
              return false;

            case 400:
              Get.snackbar(
                "Bad Request",
                "Verification code has expired or is invalid.",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
              return false;

            case 422:
              Get.snackbar(
                "Validation Error",
                "The email must be a valid email address, and the verification code must be 6 characters.",
                snackPosition: SnackPosition.BOTTOM,
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
              return false;
            default:
              ErrorDialog.showDialog();
              throw Exception(
                  "Unknown response status code: ${response.statusCode}");
          }
        }
      } else if (verificationType == 'register') {
        response = await DioRequests.requestVerifyEmail(
          email: email,
          code: codeController.value.text,
        );
      }
      Get.back();
      if (response == null) {
        ErrorDialog.showDialog();
        throw Exception("response is null");
      } else {
        switch (response.statusCode) {
          case 200:
            return true;
          case 404:
            Get.snackbar(
              "Not Found",
              "Not Found: this email has no user , try to register first",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return false;

          case 400:
            Get.snackbar(
              "Bad Request",
              "bad request: Verification code has expired or  invalid.",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return false;
          case 403:
            Get.snackbar(
              "forbidden",
              " your account is already verified , try to login",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return false;
          case 422:
            Get.snackbar(
              "Validation Error",
              "The verification code field must be 6 characters,The email field must be a valid email address",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return false;
          default:
            ErrorDialog.showDialog();
            throw Exception(
                "Unknown response status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      debugPrint("Authentication Controller: $e");
      debugPrint("Authentication Controller: $response");
      return false;
    }
  }

  Future<bool> resendVerificationCode() async {
    final String email = Get.arguments['email'];
    LoadingDialog.showDialog();
    Response? response;
    try {
      response = await DioRequests.requestResendVerifyEmail(email: email);
      Get.back();
      if (response == null) {
        ErrorDialog.showDialog();
        throw Exception("response is null");
      } else {
        switch (response.statusCode) {
          case 200:
            return true;
          case 401:
            Get.snackbar(
              "Validation Error",
              "general error : the token is expires.",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return false;
          default:
            throw Exception(
                "Unknown response status code: ${response.toString()}");
        }
      }
    } catch (e) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      debugPrint("Authentication Controller: $e");
      debugPrint("Authentication Controller: $response");
      return false;
    }
  }

  Future<bool> resend2faCode() async {
    final String email = Get.arguments['email'];
    LoadingDialog.showDialog();
    Response? response;
    try {
      response =
          await DioRequests.request2FA(email: email, code: codeController.text);
      Get.back();
      if (response == null) {
        ErrorDialog.showDialog();
        throw Exception("response is null");
      } else {
        switch (response.statusCode) {
          case 200:
            return true;
          case 401:
            Get.snackbar(
              "Validation Error",
              "general error : the token is expires.",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
            return false;
          default:
            throw Exception(
                "Unknown response status code: ${response.toString()}");
        }
      }
    } catch (e) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      debugPrint("Authentication Controller: $e");
      debugPrint("Authentication Controller: $response");
      return false;
    }
  }

  void cancelTimer() {
    if (_timer != null) {
      _timer!.cancel();
      _timer = null;
      timerString.value = "00:00";
      timerDone.value = true;
    }
  }

  bool isTokenExpired() {
    int? expiresIn = storage.read('expires_in');
    print('expiresIn $expiresIn');
    if (expiresIn == null) {
      return true;
    }

    // Check if the current time has passed the token's expiry time
    DateTime tokenExpiryTime = DateTime.now().add(Duration(seconds: expiresIn));
    return DateTime.now().isAfter(tokenExpiryTime);
  }

  Future<void> logout({bool istokenExpired = false}) async {
    cancelTimer();
    LoadingDialog.showDialog();

    String? token = storage.read('access_token');
    print(token);
    if (token == null) {
      Get.back();
      ErrorDialog.showDialog(content: "No token found!");
      return;
    }
    if (isTokenExpired()) {
      print(isTokenExpired());
      Get.back();
      storage.remove('access_token');
      Get.offAllNamed('/login');
      Get.snackbar(
        "Token Expired",
        "Session has expired, logging out.",
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    try {
      Response response = await Dio().post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      Get.back();

      if (response.statusCode == 200) {
        storage.remove('access_token');
        Get.offAllNamed('/login');
        Get.snackbar(
          "Success",
          "User logged out successfully!",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else if (response.statusCode == 401) {
        logout(istokenExpired: isTokenExpired());
      } else {
        ErrorDialog.showDialog(content: "Failed to logout!");
      }
    } catch (e) {
      Get.back();
      ErrorDialog.showDialog(content: "Error during logout: $e");
    }
  }
}
