import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class RatingBuilder extends StatelessWidget {
  const RatingBuilder({required this.rating, this.mainAxisAlignment, Key? key})
      : super(key: key);
  final int rating;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        for (var i = 0; i < 5; i++)
          Padding(
            padding: EdgeInsets.only(
              right: i < 4 ? 3 : 0,
            ),
            child: SvgPicture.asset(
              'assets/svg/star.svg',
              width: 16,
              color: i < rating ? AppTheme.yellow : AppTheme.brightGray,
            ),
          ),
        Text(
          '($rating)',
          style: AppTheme.twelve.copyWith(
            color: AppTheme.darkOrange,
          ),
        )
      ],
    );
  }
}
