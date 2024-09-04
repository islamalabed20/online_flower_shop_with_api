import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final bool isFilled;
  final VoidCallback onTap;

  const Star({super.key, required this.isFilled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isFilled ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 30.0,
      ),
    );
  }
}
