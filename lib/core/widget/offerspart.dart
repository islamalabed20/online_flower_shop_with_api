import 'package:flutter/cupertino.dart';

class OffersPart extends StatelessWidget {
  const OffersPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Offers',
          style: TextStyle(
              fontSize: 20,
              color: Color(0xff3C2367),
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat'),
        ),
        SizedBox(
          height: 270,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(29.0),
                      bottomRight: Radius.circular(6.0),
                      topLeft: Radius.circular(6.0),
                      topRight: Radius.circular(6.0),
                    ),
                    border: Border.all(
                      color: const Color(0xffF6E1D8),
                      width: 4.0,
                    )),
                width: 300,
                height: 250,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                alignment: Alignment.center,
              ),
              Positioned(
                  top: 0, child: Image.asset('assets/images/Ceramic.png')),
              const Positioned(
                bottom: 0,
                child: SizedBox(
                  width: 230,
                  child: Column(
                    children: [
                      Text(
                        'Happy Mothers Day',
                        style: TextStyle(
                            color: Color(0xff707070),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w800,
                            fontSize: 20),
                      ),
                      Text(
                        'On this special Occasion get 50% discount on the Artificial Silk Roses',
                        style: TextStyle(
                            color: Color(0xff8C8A8C),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
