import 'package:flutter/material.dart';

class BestSellerItem {
  final String imagePath;
  final String name;
  final double price;

  BestSellerItem({
    required this.imagePath,
    required this.name,
    required this.price,
  });
}

class BestSeller extends StatelessWidget {
  BestSeller({super.key});
  final List<BestSellerItem> items = [
    BestSellerItem(
      imagePath: 'assets/images/bestseller1.png',
      name: 'Dendrobium Lasting Orchids',
      price: 20.00,
    ),
    BestSellerItem(
      imagePath: 'assets/images/bestseller2.png',
      name: 'Faux Eyebrow leaf',
      price: 25.00,
    ),
    // Add more items here
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Best Seller',
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Color(0xff3C2367),
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat'),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.56, // Controls the aspect ratio of the items
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xffE6F6F6),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(29.0),
                        bottomRight: Radius.circular(6.0),
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(item.imagePath),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 150,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF3C2367),
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                  'Price: \$${item.price.toStringAsFixed(2)}', // Example price
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(0xFF3C2367),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: MaterialButton(
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
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
