import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/startcontroller.dart';

class Reviews extends StatelessWidget {
  final StarRatingController ratingController;
  final String opinion;
  final int initialRating;

  Reviews({
    super.key,
    this.initialRating = 0,
    required this.opinion,
  }) : ratingController = StarRatingController() {
    ratingController.rating.value = initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'User Name',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Text(
                    'Date Of Review',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                        style: const TextStyle(
                            color: Color(0xff6E6D6D),
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                        opinion),
                  )
                ],
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: () => ratingController.updateRating(index + 1),
                      child: Icon(
                        index < ratingController.rating.value
                            ? Icons.star // Selected star
                            : Icons.star_border, // Unselected star
                        color: index < ratingController.rating.value
                            ? Color(0xffDBDF42) // Selected star color
                            : Colors.black, // Unselected star border color
                        size: 20.0,
                      ),
                    );
                  }),
                );
              }),
            ],
          ),
        ),
        const Divider(
          thickness: 3,
          color: Color(0xffE5F5F5),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            
          ),
        )
      ],
    );
  }
}
