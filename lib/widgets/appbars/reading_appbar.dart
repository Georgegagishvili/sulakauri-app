import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/pages/reading/widgets/font_settings.dart';
import 'package:sulakauri/theme/apptheme.dart';

class ReadingAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReadingAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: MediaQuery.of(context).padding.top + 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/svg/arrow_left.svg',
          ),
          const Spacer(),
          _iconBtn(() {}, 'search'),
          _iconBtn(
            () => const FontSettingsPopup().show(context),
            'font',
          ),
          _iconBtn(() {}, 'share'),
          _iconBtn(() {}, 'bookmark'),
          const SizedBox(width: 20),
          SvgPicture.asset(
            'assets/svg/close.svg',
          ),
        ],
      ),
    );
  }

  Widget _iconBtn(action, svg) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: action,
        child: SvgPicture.asset(
          'assets/svg/$svg.svg',
          color: AppTheme.silver,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
