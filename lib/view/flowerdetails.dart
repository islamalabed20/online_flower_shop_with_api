import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/controller/flowerdetailscontroller.dart';
import 'package:online_flower_shop_auth/core/widget/custumbottombar.dart';
import 'package:online_flower_shop_auth/core/widget/flowercolor.dart';
import 'package:online_flower_shop_auth/core/widget/header.dart';
import 'package:online_flower_shop_auth/core/widget/reviews.dart';
import 'package:online_flower_shop_auth/core/widget/selectedfower.dart';
import 'package:online_flower_shop_auth/view/mycart.dart';


class FlowerDetails extends StatelessWidget {
  final FlowerColorController controller = Get.put(FlowerColorController());
  FlowerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: 31,
            ),
            const SelectedFlower(
                imagePath: 'assets/images/Artificial.png',
                name: 'Phalaenopsis White Orchid Steam',
                price: 20),
            const SizedBox(
              height: 36,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Color',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        color: Color(0xff3C2367)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FlowerColor(
                          imagePath: 'assets/images/mini.png', color: 'White'),
                      FlowerColor(
                        imagePath: 'assets/images/mini2.png',
                        color: 'Pink',
                      ),
                      FlowerColor(
                          imagePath: 'assets/images/mini3.png', color: 'Purple')
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xffF3E9F5),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flower information',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        color: Color(0xff3C2367)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'White orchids are elegant and timeless flowers that symbolize purity, beauty, and refinement. Known for their pristine white petals and intricate blooms, they are a favorite in both floral arrangements and home decor. White orchids are often associated with luxury and grace, making them a popular choice for weddings, anniversaries, and other special occasions.',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xffF3E9F5),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How to Take care of it',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        color: Color(0xff3C2367)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Place your orchid in bright, indirect light and maintain a temperature between 65-75°F. Water weekly, allowing the medium to dry slightly, and maintain 50-70% humidity. Use orchid fertilizer monthly and repot every 1-2 years with specialized medium. Prune dead blooms and check regularly for pests to keep it healthy.',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xffF3E9F5),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: InkWell(
                      child: Container(
                        width: 170,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE5F5F5),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: const Center(
                          child: Text(
                            'Add To Basket ',
                            style: TextStyle(
                                color: Color(0xff3C2367),
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Roboto',
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to(const MyCart());
                      },
                      child: Container(
                        width: 170,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF6E1D8),
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                        ),
                        child: const Center(
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                                color: Color(0xff3C2367),
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Roboto',
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xffF3E9F5),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Reviews',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Montserrat',
                        color: Color(0xff3C2367)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 3,
                    color: Color(0xffE5F5F5),
                  ),
                  Reviews(
                    initialRating: 5,
                    opinion: 'such a flower i love havig it in my living room',
                  ),
                  Reviews(
                    initialRating: 3,
                    opinion: 'beautiful',
                  ),
                  Reviews(
                    initialRating: 4,
                    opinion: 'glad i bought it ',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: const Color(0xffD9D9D9),
                    width: 4.0,
                  ),
                ),
                width: 334,
                height: 82,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 16.0), // Add left padding here
                  child: Text('Add Comment'),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
