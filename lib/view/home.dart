import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/core/widget/bestseller.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';
import 'package:online_flower_shop_auth/core/widget/header.dart';
import 'package:online_flower_shop_auth/core/widget/offerspart.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //   context,
    //   designSize: const Size(360, 690), // Specify your design size here
    //   minTextAdapt: true,
    //   splitScreenMode: true,
    // );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Header(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Hello User',
              style: TextStyle(
                  color: Color(0xff3C2367),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  fontFamily: 'Montserrat'),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0xffF3E9F5),
                    width: 4.0,
                  )),
              width: 260,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              alignment: Alignment.center,
              child: const Text(
                'Explore our stunning collection of flowers and vibrant plants to brighten every occasion.',
                style: TextStyle(color: Color(0xff8C8A8C)),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            const OffersPart(),
            const SizedBox(
              height: 20,
            ),
            BestSeller(),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Customize Special Gifts  ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff3C2367),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/gifts1.png',
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
