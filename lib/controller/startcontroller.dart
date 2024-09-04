import 'package:get/get.dart';

class StarRatingController extends GetxController {
  RxInt rating = 0.obs;

  void updateRating(int newRating) {
    rating.value = newRating;
  }
}
