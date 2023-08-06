import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/dummy_data.dart';

class ProgressBookCard extends StatelessWidget {
  const ProgressBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Random random = Random();
    final number = random.nextInt(98);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 178,
            height: 245,
            color: AppTheme.brightGray,
            child: Image.network(
              DummyData().getRandomBookCover,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 7),
        const Text(
          'There was still love',
          style: AppTheme.sixteen,
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 178,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: _progressLineBuilder(number),
              ),
              const SizedBox(width: 8),
              Text(
                '$number%',
                style: AppTheme.fourteen.copyWith(
                  color: AppTheme.silver,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _progressLineBuilder(number) {
    return Stack(
      children: [
        _progressLine(AppTheme.brightGray, 100),
        _progressLine(AppTheme.darkOrange, number),
      ],
    );
  }

  Widget _progressLine(Color color, int widthPercentage) {
    return Container(
      height: 4,
      width: 178 * widthPercentage / 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: color,
      ),
    );
  }
}
