import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/filtercontroller.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';
import 'package:online_flower_shop_auth/core/widget/floweritems.dart';
import 'package:online_flower_shop_auth/core/widget/flowersbuttons.dart';
import 'package:online_flower_shop_auth/core/widget/header.dart';
import 'package:online_flower_shop_auth/view/filterpage.dart';


class FlowersPage extends StatelessWidget {
  final FilterController filterController = Get.put(FilterController());
  FlowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Flowers',
              style: TextStyle(
                  color: Color(0xff3C2367),
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                  fontFamily: 'Montserrat'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                      ),
                      onPressed: () {
                        Get.to(const FilterPage());
                      },
                      color: const Color(0xffE6F6F6),
                      textColor: const Color(0xFF8F8F8F),
                      child: const Text('Filter',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              fontSize: 14)),
                    ),
                  )),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: FlowerButtons(
                      text: 'Best sellers',
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: FlowerButtons(
                      text: 'Most Gifted',
                    ),
                  ),
                ],
              ),
            ),
            FlowerItems()
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
