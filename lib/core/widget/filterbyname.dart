import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/core/widget/filterbutton.dart';

class FilterByName extends StatelessWidget {
  const FilterByName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
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
                text: 'Lily',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: 'Orchids',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: 'Roses',
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
              text: 'Daisies',
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
