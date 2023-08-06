import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class IconTextField extends StatelessWidget {
  const IconTextField(
      {required this.controller,
      required this.hint,
      required this.svgPath,
      this.onChanged,
      Key? key})
      : super(key: key);
  final TextEditingController controller;
  final String hint;
  final String svgPath;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 19,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: AppTheme.cultured,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/sun.svg',
            color: AppTheme.silver,
          ),
          Flexible(
            child: TextField(
              controller: controller,
              style: AppTheme.fourteen.copyWith(
                height: 1,
                color: AppTheme.silver,
              ),
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.only(
                  left: 12,
                ),
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
