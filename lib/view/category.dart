import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/view/flower.dart';

class CategoriesCart extends StatelessWidget {
  const CategoriesCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      height: 530,
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          border: Border.all(width: 5, color: const Color(0xffF6E1D8)),
          borderRadius: BorderRadius.circular(26)),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to( FlowersPage());
                      },
                      child: const Text(
                        'Flowers',
                        style: TextStyle(
                            color: Color(0xff3C2367),
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Color(0xffF6E1D8),
                    ),
                    const Text(
                      'Plants',
                      style: TextStyle(
                          color: Color(0xff3C2367),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Color(0xffF6E1D8),
                    ),
                    const Text(
                      'Bouquet',
                      style: TextStyle(
                          color: Color(0xff3C2367),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Color(0xffF6E1D8),
                    ),
                    const Text(
                      'Offers',
                      style: TextStyle(
                          color: Color(0xff3C2367),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      thickness: 3,
                      color: Color(0xffF6E1D8),
                    ),
                    const Text(
                      'Gifts',
                      style: TextStyle(
                          color: Color(0xff3C2367),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/test.png',
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
