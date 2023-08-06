import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';

class BookCoverTextBuilder extends StatelessWidget {
  const BookCoverTextBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'From The Back Cover',
          style: AppTheme.eighteen,
        ),
        const SizedBox(height: 14),
        Text(
          'It is the morning of the reaping that '
          'will kick off the tenth '
          'annual Hunger Games. In the Capitol, eighteen-year-old…',
          style: AppTheme.sixteen.copyWith(
            color: AppTheme.silver,
          ),
        )
      ],
    );
  }
}
