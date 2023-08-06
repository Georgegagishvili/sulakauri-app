import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class BookAuthorBuilder extends StatelessWidget {
  const BookAuthorBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Book\'s Author',
          style: AppTheme.eighteen,
        ),
        const SizedBox(height: 19),
        Row(
          children: [
            const CircleAvatar(
              radius: 25.5,
              backgroundColor: AppTheme.silver,
            ),
            const SizedBox(width: 9),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'J. K. Rowling',
                  style: AppTheme.sixteen.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '124 books • 1.8m reads',
                  style: AppTheme.fourteen.copyWith(
                    color: AppTheme.silver,
                    height: 1,
                  ),
                )
              ],
            ),
            const Spacer(),
            CircleAvatar(
              radius: 18,
              backgroundColor: AppTheme.lightOrange,
              child: SvgPicture.asset('assets/svg/plus.svg'),
            ),
          ],
        )
      ],
    );
  }
}
