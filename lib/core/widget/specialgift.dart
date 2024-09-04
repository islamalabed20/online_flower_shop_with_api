import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizeSpecialGifts extends StatelessWidget {
  const CustomizeSpecialGifts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Customize Special Gifts  ',
            style: TextStyle(
                fontSize: 20,
                color: Color(0xff3C2367),
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat'),
          ),
        ),
        Container(
          //     decoration: AppDeco
          padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 20.h),
          width: double.maxFinite,
          child: Stack(
            //  alignment: Alignment.bottomRight,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 192.h,
                  width: 160.h,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(6.h)),
                      border: Border.all(color: const Color(0xff9E9289), width: 3.h)),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 128.h,
                    margin: EdgeInsets.only(right: 8.h, bottom: 14.h),
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 8.h),
                          child: const Text(
                            'Love Box',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                                color: Color(0xfff6e1d8),
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: const Text(
                            'Check Out The Special flower arrangement with a luxurious chocolate box',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 14,
                                color: Color(0xff707070),
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset(
                fit: BoxFit.cover,
                'assets/images/gifts.png',
                height: 198.h,
                width: 200.h,
                alignment: Alignment.centerLeft,
              )
            ],
          ),
        ),
      ],
    );
  }
}
