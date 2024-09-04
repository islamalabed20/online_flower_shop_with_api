import 'package:flutter/material.dart';

class PaymentMethod extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const PaymentMethod({super.key, required this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: () {
          onPressed;
        },
        color: Colors.white,
        textColor: const Color(0xFF3C2367),
        // minWidth: 100,
        height: 28,
        child: Text(text,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                fontSize: 12)),
      ),
    );
  }
}
