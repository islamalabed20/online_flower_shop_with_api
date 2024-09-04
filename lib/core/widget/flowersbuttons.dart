import 'package:flutter/material.dart';

class FlowerButtons extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const FlowerButtons({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        onPressed: () {
          onPressed;
        },
        color: Color(0xffE6F6F6),
        textColor: const Color(0xFF8F8F8F),
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                fontSize: 14)),
      ),
    );
  }
}
