import 'package:flutter/material.dart';

class CustomSettingMenu extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const CustomSettingMenu(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff8C8A8C),
                        fontSize: 12),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset('assets/images/left-arrow3.png')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
