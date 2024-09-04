import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/view/login.dart';

class CustomBack extends StatelessWidget {
  const CustomBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 220,
      top: MediaQuery.of(context).size.height * 0.01,
      child: InkWell(
        onTap: () {
          Get.to( LoginPage());
        },
        child: Image.asset(
          'assets/images/left-arrow2.png',
          width: 170,
        ),
      ),
    );
  }
}
