import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String title;
  final String content;

  const PopUp({super.key, this.title = '', required this.content});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(0xffffffff)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            children: [
              const Text(''),
              const Text(
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xff8C8A8C)),
                  'Thank you for your order! It has been successfully submitted. You can track and make changes to it by visiting the \'My Orders \'section '),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: MaterialButton(
                  padding: const EdgeInsets.symmetric(
                    vertical: 13,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: const Color(0xffE6F6F6),
                  textColor: const Color(0xFF8F8F8F),
                  child: const Text('Got it',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                          fontSize: 14)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
