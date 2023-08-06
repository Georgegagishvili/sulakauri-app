import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/dummy_data.dart';
import 'package:sulakauri/widgets/buttons/orange_button.dart';
import 'package:sulakauri/widgets/other/rating.dart';

class BookHeaderBuilder extends StatelessWidget {
  const BookHeaderBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ),
          child: Container(
            height: 245,
            width: 178,
            color: AppTheme.silver,
            child: Image.network(
              DummyData().getRandomBookCover,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Harry Potter',
          textAlign: TextAlign.center,
          style: AppTheme.twenty.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Fantasy',
          textAlign: TextAlign.center,
          style: AppTheme.sixteen.copyWith(
            color: AppTheme.silver,
          ),
        ),
        const SizedBox(height: 6),
        const RatingBuilder(
          rating: 4,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: OrangeButton(
                label: '\$11.95',
                onClick: () {},
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: OrangeButton(
                label: 'Add',
                onClick: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
