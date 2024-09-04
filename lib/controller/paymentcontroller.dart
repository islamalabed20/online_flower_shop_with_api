import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;
  var selectedOption = 'Yes'.obs; 

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  void nextPage() {
    if (currentPage.value < 1) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void selectOption(String value) {
    selectedOption.value = value;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
