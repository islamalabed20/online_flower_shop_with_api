import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/core/widget/filterbutton.dart';

class FilterByPrice extends StatelessWidget {
  const FilterByPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Price',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Color(0xff3C2367)),
        ),
        Row(
          children: [
            Expanded(
              child: FilterButtons(
                text: '10_30\$',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: '30_50\$',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: '50_100\$',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        Row(
          children: [
            FilterButtons(
              text: '100+',
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ],
    );
  }
}
