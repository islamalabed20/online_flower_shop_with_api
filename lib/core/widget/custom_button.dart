import 'package:flutter/material.dart';

class CustomButtomAuth extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomButtomAuth({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: () {
          onPressed;
        },
        color: const Color(0xFF3C2367),
        textColor: Colors.white,
        minWidth: 220,
        height: 28,
        child: Text(text,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
