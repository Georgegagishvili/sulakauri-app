import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sulakauri/providers/nav_provider.dart';
import 'package:sulakauri/theme/apptheme.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
                color: AppTheme.ashGray.withOpacity(0.4),
                blurRadius: 3,
                spreadRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _iconButton(0),
          _iconButton(1),
          _iconButton(2),
          _iconButton(3),
        ],
      ),
    );
  }

  Widget _iconButton(int idx) {
    return Consumer<NavProvider>(
      builder: (context, navProvider, __) {
        return GestureDetector(
          onTap: () => navProvider.setNavIndex(idx),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: idx == navProvider.getNavIndex
                ? AppTheme.orange
                : AppTheme.nickel,
          ),
        );
      },
    );
  }
}
