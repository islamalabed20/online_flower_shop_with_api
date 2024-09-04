import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/filtercontroller.dart';

class FilterButtons extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  // Create an instance of the FilterController
  final FilterController filterController = Get.find<FilterController>();

  FilterButtons({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        // Determine the background color based on whether the button is selected
        final isSelected = filterController.selectedFilters.contains(text);
        return InkWell(
          onTap: () {
            // Toggle the selected filter and call onPressed callback
            filterController.toggleFilter(text);
            if (onPressed != null) {
              onPressed!();
            }
          },
          child: Container(
            width: 75,
            height: 41,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: const Color(0xffF3E9F5)),
              color: isSelected
                  ? const Color(0xff3C2367)
                  : Colors.white, // Change color on selection
            ),
            margin: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  color: isSelected
                      ? Colors.white
                      : Colors.black, // Change text color on selection
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
