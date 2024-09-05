import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';
import 'package:online_flower_shop_auth/core/widget/mycartbutton.dart';
import 'package:online_flower_shop_auth/core/widget/ordercart.dart';
import 'package:online_flower_shop_auth/view/login.dart';
import 'package:online_flower_shop_auth/view/payment.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(LoginPage());
                              },
                              child: Image.asset(
                                'assets/images/left-arrow2.png',
                                //   width: 150,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'My Cart',
                              style: TextStyle(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : const Color(0xff3C2367),
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/Ellipse33.png',
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: Image.asset('assets/images/mycart.png'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderCart(
                    title: 'Phalaenopsis White Orchid Steam',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OrderCart(
                    title: 'Aloe Vera Barbadensis Miller',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: Color(0xff2C2367),
                    height: 2,
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address: Dummar street A building number 25",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xff8C8A8C),
                    ),
                  ),
                  const MyCartButton(
                    text: 'Change Address',
                  ),
                  Text(
                    "Expected Date: june/26/2024",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xff8C8A8C),
                    ),
                  ),
                  Text(
                    "Expected Time: 2:30 PM",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xff8C8A8C),
                    ),
                  ),
                  const MyCartButton(
                    text: 'Schedule Send Time',
                  ),
                  Text(
                    "Delivery: 20\$",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xff8C8A8C),
                    ),
                  ),
                  Text(
                    "Taxes: 15\$",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : const Color(0xff8C8A8C),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Total Price: ",
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : const Color(0xff3C2367),

                            // Custom color for "Order"
                            fontSize: 15, // Custom font size for "Order"
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto', // Custom font weight
                          ),
                        ),
                        TextSpan(
                          text: '15\$',
                          style: TextStyle(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : const Color(0xff8C8A8C),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(20),
                onPressed: () {
                  Get.to(PaymentPage());
                },
                color: const Color(0xFFF6E1D8),
                textColor: const Color(0xff3C2367),
                minWidth: 200,
                // height: 38,
                child: const Text('Continue',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
