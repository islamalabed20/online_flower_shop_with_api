import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:online_flower_shop_auth/core/services/dio_services.dart';
import 'package:online_flower_shop_auth/core/utility/settings_services.dart';

class DioRequests {
  static final _dioService = Get.find<DioService>();
  static final _settingsService = Get.find<SettingsService>();

  static Future<Response?> requestSignup({
    required String username,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirmation,
    File? profilePhoto,
    PlatformFile? certificate,
  }) async {
    Response? response;
    String? photoName =
        (profilePhoto != null) ? profilePhoto.path.split('/').last : null;
    String? certificateName =
        (certificate != null) ? certificate.path!.split('/').last : null;
    try {
      FormData formData = FormData.fromMap({
        "user_name": username,
        "phone_number": phone,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "profile_photo": (profilePhoto != null)
            ? await MultipartFile.fromFile(
                profilePhoto.path,
                filename: photoName,
              )
            : null,
        "certificate": (certificate != null)
            ? await MultipartFile.fromFile(
                certificate.path!,
                filename: certificateName,
              )
            : null,
      });
      response = await _dioService.post(
        url: "register",
        data: formData,
      );
    } catch (e) {
      debugPrint("Signup API: $e");
    }
    return response;
  }

  static Future<Response?> requestLogin({
    required String email,
    required String password,
  }) async {
    Response? response;
    try {
      FormData formData = FormData.fromMap({
        "identifier": email,
        "password": password,
      });
      response = await _dioService.post(
        url: "login",
        data: formData,
      );
    } catch (e) {
      debugPrint("Login API: $e");
    }
    return response;
  }

  static Future<Response?> requestLogout() async {
    Response? response;
    try {
      response = await _dioService.post(
        url: "logout",
        authToken: _settingsService.getToken(),
      );
    } catch (e) {
      debugPrint("Logout API: $e");
    }
    return response;
  }

  static Future<Response?> requestVerifyEmail(
      {required String code, required String email}) async {
    Response? response;
    try {
      FormData formData = FormData.fromMap({
        "email": email,
        "verification_code": code,
      });
      response = await _dioService.post(
        url: "verify-code",
        data: formData,
      );
    } catch (e) {
      debugPrint("Verify Email API: $e");
    }
    return response;
  }

  static Future<Response?> request2FA(
      {required String code, required String email}) async {
    Response? response;
    try {
      FormData formData = FormData.fromMap({
        "email": email,
        "TwoFactorAuth": code,
      });
      response = await _dioService.post(
        url: "confirm-2fa-code",
        data: formData,
      );
    } catch (e) {
      debugPrint("Verify Email API: $e");
    }
    return response;
  }

  static Future<Response?> requestResendVerifyEmail(
      {required String email}) async {
    Response? response;
    try {
      FormData formData = FormData.fromMap({
        "email": email,
      });
      response = await _dioService.post(
          url: "resend-verification-code", data: formData);
    } catch (e) {
      debugPrint("ٌResend Verify Email API: $e");
    }
    return response;
  }

  /// This API is not available yet. It only returns a null value.
  ///
  static Future<Response?> requestForgotPassword({
    required String email,
  }) async {
    Response? response;
    return response;
  }
}
