import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/login_controller.dart';

import 'package:online_flower_shop_auth/controller/signup_controller.dart';
import 'package:online_flower_shop_auth/core/utility/dio_request.dart';
import 'package:online_flower_shop_auth/core/utility/settings_services.dart';
import 'package:online_flower_shop_auth/core/widget/loading_dialog.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(
    //   () => SplashController(),
    // );
    // Get.lazyPut(
    //   () => LoginController(),
    // );
    Get.lazyPut(
      () => SignupController(),
    );
  }
}

// class SplashBindings implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(
//       () => SplashController(),
//     );
//   }
// }

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
    );
  }
}

class SignupBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignupController(),
    );
  }
}

// class AuthBindings implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut(
//       () => AuthenticationController(),
//     );
//   }
// }

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LogoutController(),
    );
  }
}

class LogoutController {
  final _settingsService = Get.find<SettingsService>();

  Future<bool> requestLogout() async {
    Response? response;
    try {
      Get.back();
      LoadingDialog.showDialog();
      response = (await DioRequests.requestLogout()) as Response?;
      Get.back();
      if (response == null) {
        throw Exception("response is null");
      } else {
        switch (response.statusCode) {
          case 200:
            _settingsService.logout();
            return true;
          case 401:
            _settingsService.logout();
            return true;
          default:
            throw Exception("Unknown status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      debugPrint("Logout Controller: $e");
      debugPrint("Logout Controller: $response");
      return false;
    }
  }
}


