import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/theme/apptheme.dart';

class TitleButton extends StatelessWidget {
  const TitleButton({
    this.title,
    this.onClick,
    this.margin,
    Key? key,
  }) : super(key: key);
  final String? title;
  final EdgeInsets? margin;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onClick,
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? 'Top page turners',
              style: AppTheme.twentyFour,
            ),
            SvgPicture.asset(
              'assets/svg/arrow_right.svg',
            )
          ],
        ),
      ),
    );
  }
}
