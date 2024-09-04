import 'package:get/get.dart';

class MainController extends GetxController {
  // This observable integer will keep track of the current tab index
  var selectedIndex = 0.obs;

  // Method to update the selected index
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}