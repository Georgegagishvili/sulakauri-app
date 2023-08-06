import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sulakauri/enums/font_alignment.dart';
import 'package:sulakauri/enums/font_colors.dart';
import 'package:sulakauri/enums/line_spacing.dart';
import 'package:sulakauri/providers/reading_provider.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/widgets/buttons/setting_radio.dart';

class _FontSettingsPopupState extends State<FontSettingsPopup> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (idx == 0) {
          Navigator.of(context).pop();
        } else {
          setState(() => idx = 0);
        }

        return false;
      },
      child: Consumer<ReadingProvider>(
        builder: (_, readingProvider, __) {
          return Align(
            child: AnimatedContainer(
              height: 512,
              duration: const Duration(milliseconds: 350),
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: 32,
              ),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Font Settings',
                    style: AppTheme.eighteen,
                  ),
                  const SizedBox(height: 19),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      bottom: 36,
                    ),
                    decoration: BoxDecoration(
                      color: readingProvider.getSheetTheme.background,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.gunMetal.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                        )
                      ],
                    ),
                    child: Text(
                      'He walked over to the window and reflected on '
                      'his urban surroundings. He had always '
                      'loved cosy London with its empty, early estuaries.',
                      textAlign: readingProvider.getTextAlignment,
                      style: AppTheme.fourteen.copyWith(
                        fontSize: readingProvider.getFontSize,
                        color: readingProvider.getSheetTheme.text,
                        height: readingProvider.getLineSpacing /
                            readingProvider.getFontSize,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: idx == 0
                        ? _settingsColumn()
                        : idx == 1
                            ? _colorSettingsTab()
                            : idx == 2
                                ? _textAlignmentTab()
                                : _lineSpacingTab(),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _settingsColumn() {
    return Consumer<ReadingProvider>(
      key: const ValueKey('fontSettingsColumn'),
      builder: (_, readingProvider, __) {
        return Column(
          children: [
            Row(
              children: [
                const Text(
                  'Text Size',
                  style: AppTheme.sixteen,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => readingProvider.updateFontSize(-1),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppTheme.lightOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        'assets/svg/minus.svg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => readingProvider.updateFontSize(1),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: AppTheme.darkOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        'assets/svg/plus.svg',
                        color: AppTheme.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            ///
            const SizedBox(height: 28),
            _settingRow('Color', 'Black', 1),
            const SizedBox(height: 19),
            _settingRow('Line Spacing', 'Normal', 2),
            const SizedBox(height: 19),
            _settingRow('Alignment', 'Left Aligned', 3),
          ],
        );
      },
    );
  }

  Widget _settingRow(
    String textOne,
    String textTwo,
    int index,
  ) {
    return GestureDetector(
      onTap: () => setState(() => idx = index),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '$textOne:',
            style: AppTheme.sixteen.copyWith(
              color: AppTheme.nickel,
            ),
          ),
          const Spacer(),
          Text(
            textTwo,
            style: AppTheme.sixteen.copyWith(
              color: AppTheme.black,
            ),
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            'assets/svg/arrow_right.svg',
          )
        ],
      ),
    );
  }

  Widget _colorSettingsTab() {
    return Consumer<ReadingProvider>(
      key: const ValueKey('fotnSettingsColor'),
      builder: (_, readingProvider, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Color:',
              style: AppTheme.sixteen.copyWith(
                color: AppTheme.nickel,
              ),
            ),
            const SizedBox(height: 20),
            SettingRadioButton(
              groupValue: readingProvider.getSheetTheme.name,
              value: FontColorEnums.WHITE,
              onChanged: (v) => readingProvider.updateFontColor(v),
              title: 'White',
              svgPath: 'assets/svg/font.svg',
              svgColor: AppTheme.gunMetal,
            ),
            const SizedBox(height: 10),
            SettingRadioButton(
              groupValue: readingProvider.getSheetTheme.name,
              value: FontColorEnums.BLACK,
              onChanged: (v) => readingProvider.updateFontColor(v),
              title: 'Black',
              svgPath: 'assets/svg/font.svg',
              svgColor: AppTheme.white,
              svgContainerColor: AppTheme.gunMetal,
            ),
            const SizedBox(height: 10),
            SettingRadioButton(
              groupValue: readingProvider.getSheetTheme.name,
              value: FontColorEnums.GREEN,
              onChanged: (v) => readingProvider.updateFontColor(v),
              title: 'Green',
              svgPath: 'assets/svg/font.svg',
              svgContainerColor: AppTheme.lime,
              svgColor: AppTheme.gunMetal,
            ),
          ],
        );
      },
    );
  }

  Widget _textAlignmentTab() {
    return Consumer<ReadingProvider>(
      key: const ValueKey('fontSettingsLineSpacing'),
      builder: (_, readingProvider, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Line Spacing:',
              style: AppTheme.sixteen.copyWith(
                color: AppTheme.nickel,
              ),
            ),
            const SizedBox(height: 20),
            SettingRadioButton(
              groupValue: readingProvider.getLineSpacing,
              value: LineSpacing.narrow,
              onChanged: (v) => readingProvider.updateLineSpacing(v),
              title: 'Narrow',
              svgPath: 'assets/svg/narrow_spacing.svg',
            ),
            const SizedBox(height: 10),
            SettingRadioButton(
              groupValue: readingProvider.getLineSpacing,
              value: LineSpacing.normal,
              onChanged: (v) => readingProvider.updateLineSpacing(v),
              title: 'Normal',
              svgPath: 'assets/svg/normal_spacing.svg',
            ),
            const SizedBox(height: 10),
            SettingRadioButton(
              groupValue: readingProvider.getLineSpacing,
              value: LineSpacing.wide,
              onChanged: (v) => readingProvider.updateLineSpacing(v),
              title: 'Wide',
              svgPath: 'assets/svg/wide_spacing.svg',
            ),
          ],
        );
      },
    );
  }

  Widget _lineSpacingTab() {
    return Consumer<ReadingProvider>(
      key: const ValueKey('fontSettingsLineSpacing'),
      builder: (_, readingProvider, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Alignment:',
              style: AppTheme.sixteen.copyWith(
                color: AppTheme.nickel,
              ),
            ),
            const SizedBox(height: 20),
            SettingRadioButton(
              groupValue: readingProvider.getTextAlignment,
              value: FontAlignment.auto,
              onChanged: (v) => readingProvider.updateTextAlignment(v),
              title: 'Auto',
              svgPath: 'assets/svg/alignment_auto.svg',
            ),
            const SizedBox(height: 10),
            SettingRadioButton(
              groupValue: readingProvider.getTextAlignment,
              value: FontAlignment.left,
              onChanged: (v) => readingProvider.updateTextAlignment(v),
              title: 'Left',
              svgPath: 'assets/svg/alignment_left.svg',
            ),
            const SizedBox(height: 10),
            SettingRadioButton(
              groupValue: readingProvider.getTextAlignment,
              value: FontAlignment.right,
              onChanged: (v) => readingProvider.updateTextAlignment(v),
              title: 'Right',
              svgPath: 'assets/svg/alignment_right.svg',
            ),
          ],
        );
      },
    );
  }
}

class FontSettingsPopup extends StatefulWidget {
  const FontSettingsPopup({Key? key}) : super(key: key);

  @override
  State<FontSettingsPopup> createState() => _FontSettingsPopupState();

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }
}
