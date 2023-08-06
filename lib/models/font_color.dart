import 'dart:ui';
import 'package:sulakauri/enums/font_colors.dart';
import 'package:sulakauri/theme/apptheme.dart';

class SheetTheme {
  final Color background;
  final Color text;
  final String name;

  SheetTheme({
    required this.background,
    required this.text,
    required this.name,
  });

  static SheetTheme get getWhiteColor => SheetTheme(
        background: AppTheme.white,
        text: AppTheme.gunMetal,
        name: FontColorEnums.WHITE,
      );

  static SheetTheme get getBlackColor => SheetTheme(
        background: AppTheme.gunMetal,
        text: AppTheme.white,
        name: FontColorEnums.BLACK,
      );

  static SheetTheme get getGreenColor => SheetTheme(
        background: AppTheme.lime,
        text: AppTheme.gunMetal,
        name: FontColorEnums.GREEN,
      );
}
