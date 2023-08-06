import 'package:flutter/material.dart';
import 'package:sulakauri/enums/font_alignment.dart';
import 'package:sulakauri/enums/font_colors.dart';
import 'package:sulakauri/enums/line_spacing.dart';
import 'package:sulakauri/models/font_color.dart';

class ReadingProvider extends ChangeNotifier {
  double _fontSize = 14;

  SheetTheme _sheetTheme = SheetTheme.getWhiteColor;

  double _lineSpacing = LineSpacing.normal;

  TextAlign _textAlignment = FontAlignment.auto;

  double get getFontSize => _fontSize;

  SheetTheme get getSheetTheme => _sheetTheme;

  double get getLineSpacing => _lineSpacing;

  TextAlign get getTextAlignment => _textAlignment;

  void updateFontSize(double addSize) {
    _fontSize += addSize;
    _fontSize = _fontSize.clamp(14, 20);

    notifyListeners();
  }

  void updateFontColor(String fontColor) {
    switch (fontColor) {
      case FontColorEnums.BLACK:
        _sheetTheme = SheetTheme.getBlackColor;
        notifyListeners();
        return;
      case FontColorEnums.WHITE:
        _sheetTheme = SheetTheme.getWhiteColor;
        notifyListeners();
        return;
      case FontColorEnums.GREEN:
        _sheetTheme = SheetTheme.getGreenColor;
        notifyListeners();
        return;
    }
  }

  void updateLineSpacing(double lineSpacing) {
    _lineSpacing = lineSpacing;
    notifyListeners();
  }

  void updateTextAlignment(TextAlign textAlignment) {
    _textAlignment = textAlignment;
    notifyListeners();
  }
}
