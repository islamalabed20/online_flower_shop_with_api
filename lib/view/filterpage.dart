import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';
import 'package:online_flower_shop_auth/core/widget/filterbycat.dart';
import 'package:online_flower_shop_auth/core/widget/filterbycolor.dart';
import 'package:online_flower_shop_auth/core/widget/filterbyname.dart';
import 'package:online_flower_shop_auth/core/widget/filterbyprice.dart';
import 'package:online_flower_shop_auth/core/widget/flowersbuttons.dart';
import 'package:online_flower_shop_auth/core/widget/header.dart';
import 'package:online_flower_shop_auth/view/flower.dart';


class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
             Header(),
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: FlowerButtons(
                      text: 'Filter',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FlowerButtons(
                      text: 'Best sellers',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: FlowerButtons(
                      text: 'Most Gifted',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterByName(),
                  SizedBox(
                    height: 40,
                  ),
                  FilterByCategory(),
                  SizedBox(
                    height: 40,
                  ),
                  FilterByColor(),
                  SizedBox(
                    height: 40,
                  ),
                  FilterByPrice()
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                onPressed: () {
                  Get.to( FlowersPage());
                },
                color: const Color(0xFF3C2367),
                textColor: Colors.white,
                minWidth: 180,
                height: 48,
                child: const Text('Done',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto',
                        fontSize: 20)),
              ),
            ),
            const SizedBox(
              height: 78,
            ),
          ],
        ),
      ),
      bottomNavigationBar:  CustomBottomBar(),
    );
  }
}
