import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/flowerdetailscontroller.dart';

class FlowerColor extends StatelessWidget {
  final String imagePath;
  final String color;

  FlowerColor({super.key, required this.imagePath, required this.color});

  final FlowerColorController controller = Get.put(FlowerColorController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectColor(color); // Update the selected color
      },
      child: Obx(() {
        // Observe the selected color to update the UI
        bool isSelected = controller.selectedColor.value == color;

        return Container(
          width: 89.0,
          height: 111.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFFFAF7F7) // Color for dark mode
                      : const Color(0xff3C2367)
                  : Colors.transparent,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 63.0,
                height: 54.0,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              Positioned(
                top: 0,
                child: Column(
                  children: [
                    Image.asset(
                      imagePath, // Correct the imagePath usage
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(color)
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
