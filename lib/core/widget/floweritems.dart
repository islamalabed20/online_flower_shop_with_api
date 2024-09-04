import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_flower_shop_auth/view/flowerdetails.dart';

class FlowerItemInfo {
  final String imagePath;
  final String name;
  final double price;
  final List<Color> colors;

  FlowerItemInfo({
    required this.imagePath,
    required this.name,
    required this.price,
    required this.colors,
  });
}

class FlowerItems extends StatelessWidget {
  FlowerItems({super.key});
  final List<FlowerItemInfo> items = [
    FlowerItemInfo(
        imagePath: 'assets/images/flowers/flower2.png',
        name: 'Magnolia Bush',
        price: 12,
        colors: [
          Colors.white,
          const Color(0xffEBA4A4),
        ]),
    FlowerItemInfo(
      imagePath: 'assets/images/flowers/flower1.png',
      name: 'Bliss Orchid',
      price: 20.00,
      colors: [
        const Color(0xffCC90C6),
        const Color(0xffF6E1D8),
        const Color(0xffFFFFFF)
      ],
    ),
    FlowerItemInfo(
      imagePath: 'assets/images/flowers/flower3.png',
      name: 'Cherry Blossom',
      price: 25.00,
      colors: [
        const Color(0xffF9EEF1),
        const Color(0xffF1E365),
        const Color(0xffFFFFFF)
      ],
    ),
    FlowerItemInfo(
      imagePath: 'assets/images/flowers/flower4.png',
      name: 'White Orchid',
      price: 30.00,
      colors: [const Color(0xffF6E1D8), const Color(0xffFFFFFF)],
    ),
    FlowerItemInfo(
      imagePath: 'assets/images/flowers/flower6.png',
      name: 'Magnolia Flower',
      price: 40.00,
      colors: [
        const Color(0xffCD979C),
        const Color(0xffF3E9F5),
        const Color(0xffffffff)
      ],
    ),
    FlowerItemInfo(
      imagePath: 'assets/images/flowers/flower5.png',
      name: 'Collection of Zanbak',
      price: 37.00,
      colors: [
        const Color(0xffFEC0C7),
        const Color(0xffF3E9F5),
        const Color(0xffE4CAB5)
      ],
    ),
    FlowerItemInfo(
      imagePath: 'assets/images/flowers/flower7.png',
      name: 'Lily',
      price: 37.00,
      colors: [const Color(0xffFEC0C7), const Color(0xffffffff)],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.5, // Controls the aspect ratio of the items
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                onTap: () {
                  Get.to(FlowerDetails());
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        color: const Color(0xffE6F6F6),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(29.0),
                          bottomRight: Radius.circular(6.0),
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: 140,
                            height: 165,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                            ),
                            child: Image.asset(
                              item.imagePath,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 150,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: item.colors
                                      .map((color) => Container(
                                            width: 15.0,
                                            height: 15.0,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 2),
                                            decoration: BoxDecoration(
                                              color: color,
                                              shape: BoxShape.circle,
                                            ),
                                          ))
                                      .toList(),
                                ),
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF3C2367),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                    'Price: \$${item.price.toStringAsFixed(0)}', // Example price
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF3C2367),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          onPressed: () {},
                          color: const Color(0xFFF3E9F5),
                          textColor: const Color(0xFF3C2367),
                          minWidth: 85,
                          height: 25,
                          child: const Text(
                            'Add to Cart',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
