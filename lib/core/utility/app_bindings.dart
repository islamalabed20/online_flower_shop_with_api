import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_flower_shop_auth/controller/authentication_controller.dart';
import 'package:online_flower_shop_auth/controller/login_controller.dart';
import 'package:online_flower_shop_auth/controller/signup_controller.dart';
import 'package:online_flower_shop_auth/core/widget/error_dialog.dart';

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

class AuthBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthenticationController(),
    );
  }
}

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LogoutController(),
    );
  }
}

class LogoutController {
  final storage = GetStorage();
  Future<bool> requestLogout() async {
    // var? response;
    String? token =
        storage.read('access_token'); // Retrieve the token from storage
    if (token == null) {
      Get.back(); // Close loading dialog
      ErrorDialog.showDialog();
      return false;
    }
    try {
      var response = await Dio().post(
        'https://abdulrahman-bashir.trainees-mad-s.com/api/v1/auth/logout',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token', // Add token to the header
          },
        ),
      );

      Get.back(); // Close loading dialog

      // If logout is successful (e.g., status code 200)
      if (response.statusCode == 200) {
        // Clear the token from storage
        storage.remove('access_token');

        // Optionally clear any other user-related data (e.g., user info)
        // storage.remove('user_data');

        // Redirect to login or welcome screen
        Get.offAllNamed('/login'); // Assuming you have a login route
      } else {
        ErrorDialog.showDialog();
      }
    } catch (e) {
      debugPrint("Logout Controller: $e");
      //  debugPrint("Logout Controller: $response");
    }
    return false;
  }
}
