import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    this.controller,
    Key? key,
  }) : super(key: key);
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        color: AppTheme.cultured,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/svg/search.svg',
          ),
          Flexible(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: AppTheme.sixteen.copyWith(
                  height: 1,
                  color: AppTheme.silver,
                ),
                contentPadding: const EdgeInsets.only(left: 8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
