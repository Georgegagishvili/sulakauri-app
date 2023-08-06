import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class SettingRadioButton extends StatelessWidget {
  const SettingRadioButton({
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.title,
    this.svgPath,
    this.svgColor,
    this.svgWidth,
    this.svgContainerColor,
    Key? key,
  }) : super(key: key);
  final dynamic groupValue;
  final dynamic value;
  final ValueChanged<dynamic> onChanged;
  final String title;
  final String? svgPath;
  final double? svgWidth;
  final Color? svgColor;
  final Color? svgContainerColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.only(
          left: 12,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          color: value == groupValue ? AppTheme.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                value == groupValue ? AppTheme.darkOrange : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            if (svgPath != null)
              Container(
                width: 80,
                height: 28,
                decoration: BoxDecoration(
                  color: svgContainerColor ?? AppTheme.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppTheme.nickel
                        .withOpacity(groupValue != value ? 1 : 0),
                    width: 0.8,
                  ),
                ),
                child: Align(
                  child: SvgPicture.asset(
                    svgPath!,
                    color: svgColor,
                    width: svgWidth,
                  ),
                ),
              ),
            if (svgPath != null) const SizedBox(width: 12),
            Text(
              title,
              style: AppTheme.sixteen.copyWith(
                color: value == groupValue ? AppTheme.black : AppTheme.nickel,
              ),
            )
          ],
        ),
      ),
    );
  }
}
