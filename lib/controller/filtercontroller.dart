import 'package:get/get.dart';

class FilterController extends GetxController {
  // Observable for the selected filters
  var selectedFilters = <String>{}.obs;
  var selectedColor = ''.obs;

  // Method to toggle filter selection
  void toggleFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  void setColor(String colorName) {
    selectedColor.value = colorName;
  }
}
