import 'package:dio/dio.dart';
import 'package:get/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:online_flower_shop_auth/core/utility/dio_request.dart';
import 'package:online_flower_shop_auth/core/widget/error_dialog.dart';
import 'package:online_flower_shop_auth/core/widget/loading_dialog.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  String? _emailError, _phoneError, _passwordError;
  bool _hidePassword;

  LoginController() : _hidePassword = true;

  bool get hidePassword => _hidePassword;
  String? get emailError => _emailError;
  String? get phoneError => _phoneError;
  String? get passwordError => _passwordError;

  set emailError(String? text) {
    _emailError = text;
    update(['email']);
  }

  set phoneError(String? text) {
    _phoneError = text;
    update(['phone']);
  }

  set passwordError(String? text) {
    _passwordError = text;
    update(['password']);
  }

  void clearEmailError() {
    _emailError = null;
    update(['email']);
  }

  bool validateEmail() {
    String email = emailController.value.text.trim();
    if (email.isEmpty) {
      _emailError = "Email is required.";
    } else if (!GetUtils.isEmail(email)) {
      _emailError = "Invalid email.";
    }
    update(['email']);
    return (_emailError == null) ? true : false;
  }

  void clearPhoneError() {
    _phoneError = null;
    update(['phone']);
  }

  bool validatePhone() {
    String phone = phoneController.value.text.trim();
    if (phone.isEmpty) {
      _phoneError = "Mobile number is required.";
    } else if (!GetUtils.isPhoneNumber(phone)) {
      _phoneError = "Invalid mobile number.";
    }
    update(['phone']);
    return (_phoneError == null) ? true : false;
  }

  void clearPasswordError() {
    _passwordError = null;
    update(['password']);
  }

  bool validatePassword() {
    String password = passwordController.value.text.trim();
    if (password.isEmpty) {
      _passwordError = "Password is required.";
    } else if (password.length < 8) {
      _passwordError = "Password must be at least 8 characters long";
    }
    update(['password']);
    return (_passwordError == null) ? true : false;
  }

  void toggleShowPassword() {
    _hidePassword = !_hidePassword;
    update(['password']);
  }

  void clearAllErrors() {
    _emailError = _phoneError = _passwordError = null;
  }

  Future<bool> checkCredentials() async {
    bool isEmailValid = validateEmail();
    bool isPasswordValid = validatePassword();
    if (!isEmailValid || !isPasswordValid) {
      return false;
    } else {
      LoadingDialog.showDialog();
      return await _performAPICall();
    }
  }

  Future<bool> _performAPICall() async {
    Response? response;
    try {
      response = await DioRequests.requestLogin(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
      Get.back();
      if (response == null) {
        ErrorDialog.showDialog();
        throw Exception("response is null");
      } else {
        final data = response.data;
        switch (response.statusCode) {
          case 200:
            clearAllErrors();
            if (response.statusCode == 200) {
              return true;
            } else {
              return false;
            }
          case 400:
            Get.snackbar(
              "Bad Request",
              "Invalid password or email, please try again.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
            return false;
          case 404:
            // User not found
            Get.snackbar(
              "Not Found",
              "There is no user for this identifier.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.orange,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
            return false;

          case 422:
            // Validation errors
            List<String> messages = List<String>.from(data['message']);
            String errorMessages = messages.join("\n");
            Get.snackbar(
              "Validation Error",
              errorMessages,
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
            );
            return false;
          default:
            throw Exception(
                "Unknown response status code: ${response.toString()}");
        }
      }
    } catch (e) {
      debugPrint("Signup Controller: $e");
      debugPrint("Signup Controller: $response");
      return false;
    }
  }
}
