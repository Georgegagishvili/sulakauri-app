import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/dummy_data.dart';
import 'package:sulakauri/widgets/other/rating.dart';

class DetailedBookCard extends StatelessWidget {
  const DetailedBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              12,
            ),
            child: Container(
              width: 84,
              height: 116,
              color: AppTheme.brightGray,
              child: Image.network(
                DummyData().getRandomBookCover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'There was still love',
                  style: AppTheme.sixteen,
                ),
                const SizedBox(height: 4),
                Text(
                  'Romance',
                  style: AppTheme.fourteen.copyWith(
                    color: AppTheme.silver,
                  ),
                ),
                const SizedBox(height: 6),
                const RatingBuilder(rating: 4),
                const SizedBox(height: 5),
                Text(
                  'It is the morning of the '
                  'reaping that will kick …..',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.fourteen.copyWith(
                    color: AppTheme.nickel,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
