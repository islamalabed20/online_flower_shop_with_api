import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/ordercontroller.dart';

class OrderCart extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController());
  final String title;

  OrderCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.85, // 85% of the parent's width
      child: Card(
        color: const Color(0xFFE6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0), // Add padding around ListTile
          child: ListTile(
            contentPadding: EdgeInsets.zero, // Remove default padding
            title: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: "Order: ",
                    style: TextStyle(
                      color: Color(0xff3C2367), // Custom color for "Order"
                      fontSize: 14, // Custom font size for "Order"
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto', // Custom font weight
                    ),
                  ),
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                      color: Color(0xff8C8A8C),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/Rectangle146.png'),
                    InkWell(
                      onTap: () {
                        // Handle delete item
                      },
                      child: Image.asset('assets/images/trash.png'),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/Rectangle146.png'),
                    InkWell(
                      onTap: () {
                        // Handle increment item
                      },
                      child: Image.asset('assets/images/+1.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
