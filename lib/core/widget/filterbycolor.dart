import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/filtercontroller.dart';

class FilterByColor extends StatelessWidget {
  const FilterByColor({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of the FilterController
    final FilterController filterController = Get.put(FilterController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Color(0xff3C2367)),
        ),
        const SizedBox(
          height: 12,
        ),
        // First row of color filters
        Row(
          children: [
            _colorContainer(const Color(0xffEBA4A4), 'somo', filterController),
            const SizedBox(width: 23),
            _colorContainer(Colors.white, 'white', filterController),
            const SizedBox(width: 23),
            _colorContainer(const Color(0xffC89AC4), 'pink', filterController),
            const SizedBox(width: 23),
            _colorContainer(const Color(0xffEBA4A4), 'skiny', filterController),
            const SizedBox(width: 23),
            _colorContainer(const Color(0xffA4CDEB), 'blue', filterController),
          ],
        ),
        const SizedBox(height: 29),
        // Second row of color filters
        Row(
          children: [
            _colorContainer(const Color(0xff46E943), 'green', filterController),
            const SizedBox(width: 23),
            _colorContainer(const Color(0xff923984), 'purple', filterController),
            const SizedBox(width: 23),
            _colorContainer(const Color(0xffEE3333), 'red', filterController),
          ],
        ),
      ],
    );
  }

  Widget _colorContainer(
      Color color, String colorName, FilterController filterController) {
    return Obx(() {
      // Determine if the current color is selected
      final isSelected = filterController.selectedColor.value == colorName;
      return GestureDetector(
        onTap: () {
          filterController.setColor(colorName);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 35.0,
              height: 35.0,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            if (isSelected)
              Container(
                width: 25.0,
                height: 25.0,
                decoration: const BoxDecoration(
                  color: Color(0xff3C2367),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      );
    });
  }
}
