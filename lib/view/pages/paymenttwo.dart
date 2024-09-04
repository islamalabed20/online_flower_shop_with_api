import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/paymentcontroller.dart';
import 'package:online_flower_shop_auth/core/widget/cardinfo.dart';
import 'package:online_flower_shop_auth/core/widget/paymentmethod.dart';
import 'package:online_flower_shop_auth/core/widget/popup.dart';
import 'package:online_flower_shop_auth/view/home.dart';
import 'package:online_flower_shop_auth/view/login.dart';


class PaymentTwoPage extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  PaymentTwoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F6F6),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to( LoginPage());
                    },
                    child: Image.asset(
                      'assets/images/left-arrow2.png',
                      //   width: 150,
                    ),
                  ),
                  const SizedBox(width: 70),
                  const Text(
                    'Payement',
                    style: TextStyle(
                        color: Color(0xff3C2367),
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        color: Color(0xFF3C2367),
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: PaymentMethod(
                                  text: 'Credit Card',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: PaymentMethod(
                                  text: 'Debit Card',
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: PaymentMethod(
                                  text: 'PayPal',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PaymentMethod(
                                text: 'Digital Wallet',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CardInformation(),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  onPressed: () {
                    Get.to(const HomePage());
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: PopUp(content: '',),
                        );
                      },
                    );
                  },
                  color: const Color(0xFF3C2367),
                  textColor: Colors.white,
                  minWidth: 220,
                  height: 28,
                  child: const Text('Continue',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
