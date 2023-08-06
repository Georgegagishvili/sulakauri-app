import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';

class ChipButton extends StatelessWidget {
  const ChipButton({
    this.label,
    Key? key,
  }) : super(key: key);
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppTheme.brightGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label ?? '',
        style: AppTheme.fourteen.copyWith(
          height: 1,
          color: AppTheme.nickel,
        ),
      ),
    );
  }
}
