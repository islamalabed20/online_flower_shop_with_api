import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:online_flower_shop_auth/controller/authentication_controller.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
  //  final controller = Get.find<AuthenticationController>();

    // final int? expiresIn = GetStorage().read('expires_in');

    // // If the expiry time is null, treat it as expired
    // if (expiresIn == null) {
     //  controller.startTokenExpiryTimer(300);
    //   return const RouteSettings(name: '/login');
    // }

    // // Calculate the token expiry date
    // final DateTime expiryDate =
    //     DateTime.now().add(Duration(seconds: expiresIn));

    // // If the current time is after the expiry date, redirect to login
    // if (DateTime.now().isAfter(expiryDate)) {
    //   controller.startTokenExpiryTimer(300);
    //   return const RouteSettings(name: '/login');
    // }

    // // If the token is still valid, continue to the requested route
    return null;
  }
}
