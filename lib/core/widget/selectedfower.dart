import 'package:flutter/material.dart';

class SelectedFlower extends StatelessWidget {
  final String imagePath;
  final String name;
  final double price;

  const SelectedFlower(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xff3C2367),
                width: 3.0,
              )),
          width: 330,
          height: 230,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                ],
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          color: Color(0xff3C2367),
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      child: Container(
                        width: 110,
                        height: 31,
                        decoration: const BoxDecoration(
                          color: Color(0xffE5F5F5),
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: Center(
                          child: Text(
                            'Price: \$$price',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Montserrat',
                                color: Color(0xff3C2367),
                                fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
