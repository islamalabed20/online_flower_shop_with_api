import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatelessWidget {
  final storage = GetStorage();

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      String? token = storage.read('access_token');
      final int? expiresIn = GetStorage().read('expires_in');
      print(expiresIn);
      // If the expiry time is null, treat it as expired
      if (expiresIn == null) {
        Get.offNamed('/login');
      }

      // Calculate the token expiry date
      final DateTime expiryDate =
          DateTime.now().add(Duration(seconds: expiresIn!));
      if (DateTime.now().isAfter(expiryDate)) {
        Get.offNamed('/login');
      }

      if (token != null && token.isNotEmpty) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/login');
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
