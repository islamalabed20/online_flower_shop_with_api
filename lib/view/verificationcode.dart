import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/Authentication_controller.dart';
import 'package:online_flower_shop_auth/core/widget/success_bottom_sheet.dart';
import 'package:pinput/pinput.dart';

class VerificationCodePage extends StatelessWidget {
  final controller = Get.find<AuthenticationController>();
  VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    var pinTheme = PinTheme(
        width: 50,
        height: 50,
        textStyle: TextStyle(
          fontSize: 22,
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black, // Set the color of the bottom border
              width: 2.0, // Set the width of the bottom border
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5.0));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xffD9E9E9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(89),
                    bottomRight: Radius.circular(89)),
              ),
              child: Center(
                child: Image.asset('assets/images/Monstera.png'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              '17'.tr,
              style: TextStyle(
                  fontSize: 22,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color(0xFF8C8A8C),
                  fontFamily: 'Montserrat'),
            ),
            SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '18'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xFF8C8A8C),
                          fontFamily: 'Montserrat'),
                    ),
                    Text(
                      '19'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xFF8C8A8C),
                          fontFamily: 'Montserrat'),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      '20'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xFF8C8A8C),
                          fontFamily: 'Montserrat',
                          fontSize: 15),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      '21'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? const Color(0xffA08EA4)
                              : const Color(0xff3C2367),
                          fontFamily: 'Montserrat',
                          fontSize: 20),
                    ),
                    Pinput(
                      length: 6,
                      obscureText: true,
                      obscuringCharacter: '*',
                      defaultPinTheme: pinTheme,
                      focusedPinTheme: pinTheme.copyWith(
                          decoration: pinTheme.decoration!.copyWith(
                        border: Border.all(color: Colors.green),
                      )),
                      onCompleted: (pin) => debugPrint(pin),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      '22'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xFF8C8A8C),
                          fontFamily: 'Montserrat',
                          fontSize: 13),
                    ),
                    Text(
                      '23'.tr,
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : const Color(0xFF8C8A8C),
                          fontFamily: 'Montserrat',
                          fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Future.delayed(
                          const Duration(milliseconds: 100),
                          () => controller.validateInput(),
                        ).then(
                          (result) async {
                            if (result == true) {
                              await SuccessBottomSheet.showBottomSheet();
                            }
                          },
                        );
                      },
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xffD9E9E9)
                          : const Color(0xFFF3E9F5),
                      textColor: Colors.white,
                      minWidth: 220,
                      height: 58,
                      child: Text('24'.tr,
                          style: const TextStyle(
                              color: Color(0xff3C2367),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                              fontSize: 16)),
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
