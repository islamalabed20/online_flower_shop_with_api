import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/view/home.dart';
import 'package:online_flower_shop_auth/view/mycart.dart';
import 'package:online_flower_shop_auth/view/setting.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: 55,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(38), topRight: Radius.circular(38)),
            color: Color(0xffD9E9E9)),
      ),
      // Image.asset('assets/images/buttombar.png'),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Get.to(const HomePage());
                },
                child: Image.asset(
                  "assets/images/home.png",
                  width: 30,
                )),
            InkWell(
                onTap: () {
                  Get.to(const MyCart());
                },
                child: Image.asset(
                  "assets/images/shopping-basket.png",
                  width: 30,
                )),
            InkWell(
                onTap: () {
                  Get.to(const SettingPage());
                },
                child: Image.asset(
                  "assets/images/setting.png",
                  width: 30,
                )),
            InkWell(
                child: Image.asset(
              "assets/images/Ellipse.png",
              width: 30,
            ))
          ],
        ),
      ),
    ]);
  }
}
