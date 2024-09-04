import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/core/widget/customsetting.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';
import 'package:online_flower_shop_auth/view/login.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // i add this controller to test the arrow back
    Get.put(());
    //
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        //height: Get.height,
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
                        'Sittings',
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
                        text: 'Security Sittings',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Support & Feedback',
                      ),
                      CustomSettingMenu(
                        onPressed: () {},
                        text: 'Language Sittings',
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                  child: IntrinsicHeight(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Color(0xffffffff)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 26.0),
                                        child: Column(
                                          children: [
                                            const Text(''),
                                            const Text(
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16,
                                                    color: Color(0xff8C8A8C)),
                                                'Are you sure you want to logout'),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 10),
                                                        child: MaterialButton(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 13,
                                                          ),
                                                          onPressed: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                    content:
                                                                        IntrinsicHeight(
                                                                  child:
                                                                      Container(
                                                                    decoration: const BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(Radius.circular(
                                                                                15)),
                                                                        color: Color(
                                                                            0xffffffff)),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              26.0),
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          const Text(
                                                                              ''),
                                                                          const Text(
                                                                              style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xff8C8A8C)),
                                                                              'You successfully logged out'),
                                                                          const SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                          Container(
                                                                            margin:
                                                                                const EdgeInsets.only(top: 10),
                                                                            child:
                                                                                MaterialButton(
                                                                              padding: const EdgeInsets.symmetric(
                                                                                vertical: 13,
                                                                              ),
                                                                              onPressed: () {
                                                                                Get.to( LoginPage());
                                                                              },
                                                                              color: const Color(0xffE6F6F6),
                                                                              textColor: const Color(0xFF8F8F8F),
                                                                              child: const Text('Ok', style: TextStyle(fontWeight: FontWeight.w500, fontFamily: 'Montserrat', fontSize: 14)),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                30,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ));
                                                              },
                                                            );
                                                          },
                                                          color: const Color(
                                                              0xffE6F6F6),
                                                          textColor:
                                                              const Color(
                                                                  0xFF8F8F8F),
                                                          child: const Text(
                                                            'Yes',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 10),
                                                        child: MaterialButton(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 13,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          color: const Color(
                                                              0xffE6F6F6),
                                                          textColor:
                                                              const Color(
                                                                  0xFF8F8F8F),
                                                          child: const Text(
                                                              'No',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize:
                                                                      14)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            },
                          );
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
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
