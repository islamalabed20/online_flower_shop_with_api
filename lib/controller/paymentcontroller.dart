import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  var currentPage = 0.obs;
  late PageController pageController;
  var selectedOption = 'Yes'.obs;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(); 
    currentPage.value = 0; 
  }

  void nextPage() {
    if (currentPage.value < 1) {
      currentPage.value++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (pageController.hasClients) {
          pageController.animateToPage(
            currentPage.value,
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
          );
        }
      });
    }
  }

  void selectOption(String value) {
    selectedOption.value = value;
  }

  @override
  void dispose() {
    pageController.dispose(); // Dispose the controller to free resources
    super.dispose();
  }
}
