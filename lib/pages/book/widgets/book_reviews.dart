import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/widgets/other/rating.dart';

class BookReviewsBuilder extends StatelessWidget {
  const BookReviewsBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Customers Review',
          style: AppTheme.eighteen,
        ),
        const SizedBox(height: 19),
        Flexible(
          child: ListView.separated(
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, idx) {
              return _bookReviewItem();
            },
            separatorBuilder: (_, __) {
              return const SizedBox(height: 28);
            },
          ),
        ),
        const SizedBox(height: 21),
        Text(
          'See all reviews >',
          style: AppTheme.sixteen.copyWith(
            color: AppTheme.darkOrange,
          ),
        )
      ],
    );
  }

  Widget _bookReviewItem() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
            CircleAvatar(
              radius: 17.5,
              backgroundColor: AppTheme.silver,
            ),
            SizedBox(width: 9),
            Text(
              'D. J. Flusha',
              style: AppTheme.fourteen,
            )
          ],
        ),
        const SizedBox(height: 9),
        const RatingBuilder(rating: 4),
        const SizedBox(height: 14),
        Text(
          'Best Book of Lorem ipsum dolor sit amet, '
          'consectetur'
          ' adipiscing elit. Ut faucibus vulputate '
          'mollis. Vivamus libero ipsum, mollis nec'
          ' elit id.',
          style: AppTheme.fourteen.copyWith(
            color: AppTheme.nickel,
          ),
        )
      ],
    );
  }
}
