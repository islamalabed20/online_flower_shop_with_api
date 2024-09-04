import 'package:get/get.dart';

class FlowerColorController extends GetxController {
  var selectedColor = ''.obs;

  void selectColor(String color) {
    selectedColor.value = color;
  }
}
