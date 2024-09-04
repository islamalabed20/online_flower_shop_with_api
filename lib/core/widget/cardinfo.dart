import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/paymentcontroller.dart';

class CardInformation extends StatelessWidget {
  final PaymentController controller = Get.put(PaymentController());

  CardInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Card information ',
          style: TextStyle(
            color: Color(0xFF3C2367),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Card Holder Full Name ',
          style: TextStyle(
            color: Color(0xFF8C8A8C),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical:
                  10.0, // Adjust this value to decrease or increase height
              horizontal: 16.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Card Number ',
          style: TextStyle(
            color: Color(0xFF8C8A8C),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical:
                  10.0, // Adjust this value to decrease or increase height
              horizontal: 16.0,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Expiration Date ',
                  style: TextStyle(
                    color: Color(0xFF8C8A8C),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width / 3,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical:
                            10.0, // Adjust this value to decrease or increase height
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CVV ',
                  style: TextStyle(
                    color: Color(0xFF8C8A8C),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: Get.width / 3,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical:
                            10.0, // Adjust this value to decrease or increase height
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Save for Future Purchases  ',
              style: TextStyle(
                color: Color(0xFF8C8A8C),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                Obx(() => Radio<String>(
                      value: 'Yes',
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectOption(value);
                        }
                      },
                    )),
                const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color(0xFF8C8A8C),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(width: 20),
                Obx(() => Radio<String>(
                      value: 'No',
                      groupValue: controller.selectedOption.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectOption(value);
                        }
                      },
                    )),
                const Text(
                  'No',
                  style: TextStyle(
                    color: Color(0xFF8C8A8C),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ],
    );
  }
}
