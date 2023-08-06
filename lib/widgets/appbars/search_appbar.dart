import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulakauri/widgets/textfields/search_textfield.dart';

class SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            const Flexible(
              child: SearchTextField(),
            ),
            const SizedBox(width: 16),
            SvgPicture.asset(
              'assets/svg/notification.svg',
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
