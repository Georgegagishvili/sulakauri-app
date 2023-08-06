import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';

class BookDescriptionBuilder extends StatelessWidget {
  const BookDescriptionBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Description',
          style: AppTheme.eighteen,
        ),
        const SizedBox(height: 14),
        _rowItem(title: 'Length', text: '336 pages'),
        const SizedBox(height: 13),
        _rowItem(title: 'Audible book', text: 'Available'),
        const SizedBox(height: 13),
        _rowItem(title: 'Screen Reader', text: 'Supported'),
        const SizedBox(height: 13),
        _rowItem(title: 'Word Wise', text: 'Enabled'),
      ],
    );
  }

  Widget _rowItem({
    required String title,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTheme.sixteen.copyWith(
            color: AppTheme.silver,
          ),
        ),
        Text(
          title,
          style: AppTheme.sixteen,
        ),
      ],
    );
  }
}
