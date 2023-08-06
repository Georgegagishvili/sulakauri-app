import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({
    this.title,
    Key? key,
  }) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.white.withOpacity(0.8),
              blurRadius: 10,
              spreadRadius: 10),
        ],
      ),
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 13,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              'assets/svg/arrow_left.svg',
            ),
          ),
          Text(
            title ?? '',
            style: AppTheme.twenty.copyWith(
              height: 1,
            ),
          ),
          SvgPicture.asset(
            'assets/svg/search.svg',
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
