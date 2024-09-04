import 'package:flutter/material.dart';
import 'package:online_flower_shop_auth/core/widget/filterbutton.dart';

class FilterByCategory extends StatelessWidget {
  const FilterByCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category Of Flowers  ',
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
                text: 'Perennials',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: 'Annuals',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: 'RosBulbses',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: FilterButtons(
                text: 'Biennials',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: 'Climbers',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: FilterButtons(
                text: 'Succulents',
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
              text: 'Shrubs',
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
