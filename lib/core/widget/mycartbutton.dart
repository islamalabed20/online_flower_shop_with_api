import 'package:flutter/material.dart';

class MyCartButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const MyCartButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: () {
        onPressed;
      },
      color: const Color(0xffD9D9D9),
      textColor: Color(0xff2C2367),
      height: 18,
      child: Text(text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }
}
