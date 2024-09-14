import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/authentication_controller.dart';
import 'package:online_flower_shop_auth/core/widget/customsetting.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // i add this controller to test the arrow back
    Get.put(());
    final controller = Get.put(AuthenticationController());
    //
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  Image.asset('assets/images/Rectangle128.png'),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Image.asset('assets/images/Ellipse2.png'),
                      Image.asset('assets/images/WeddingFlower.png')
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Settings',
                        style: TextStyle(
                            color: Color(0xff3C2367),
                            fontSize: 25,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Account Information',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'payment Methods',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Order History',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Security Settings',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Support & Feedback',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Language Settings',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Legal Information',
                      ),
                      CustomSettingMenu(
                        text: 'About us',
                        onPressed: () {},
                      ),
                      CustomSettingMenu(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          controller.logout();
                        },
                        text: 'Log Out',
                      ),
                    ],
                  ),
                ],
              ),
              Stack(alignment: Alignment.bottomCenter, children: [
                Image.asset('assets/images/Whiteroseborder.png'),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  CustomBottomBar(),
    );
  }
}
