import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/paymentcontroller.dart';
import 'package:online_flower_shop_auth/core/widget/address.dart';
import 'package:online_flower_shop_auth/core/widget/customtextfield.dart';

class PaymentOnePage extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  PaymentOnePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      'assets/images/left-arrow2.png',
                      //   width: 150,
                    ),
                  ),
                  const SizedBox(width: 70),
                  Text(
                    'Payement',
                    style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : const Color(0xff3C2367),
                        fontSize: 25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextField(
                textController: TextEditingController(),
                labelText: "Name",
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                textController: TextEditingController(),
                labelText: "Phone Number",
                keyboardType: TextInputType.number,
              ),
              CustomTextField(
                textController: TextEditingController(),
                labelText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextField(
                textController: TextEditingController(),
                labelText: "Town/City",
                keyboardType: TextInputType.emailAddress,
              ),
              const AddressField(
                labeltext1: 'Address',
                labeltext2: 'Special Instructions About Address',
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(vertical: 13),
                onPressed: () {},
                color: const Color(0xFFF3E9F5),
                textColor: Colors.white,
                minWidth: 245,
                height: 28,
                child: const Text('Use My Location',
                    style: TextStyle(
                        color: Color(0xff3C2367),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
              )),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  onPressed: () {
                    controller.nextPage();
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
              Image.asset(
                'assets/images/Rose.png',
                width: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
