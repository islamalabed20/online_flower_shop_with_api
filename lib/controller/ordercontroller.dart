import 'package:get/get.dart';

class OrderController extends GetxController {
  // The order name
  var orderName = "Order".obs;

  // Add item to order
  void addItem() {
    orderName.value += " + Item";
  }

  // Delete the order
  void deleteOrder() {
    orderName.value = "Order Deleted";
  }
}
