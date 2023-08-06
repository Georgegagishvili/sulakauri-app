import 'package:flutter/material.dart';
import 'package:sulakauri/util/dummy_data.dart';
import 'package:sulakauri/widgets/buttons/chip_button.dart';
import 'package:sulakauri/widgets/buttons/title_button.dart';

class CategoriesGridBuilder extends StatelessWidget {
  const CategoriesGridBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleButton(title: 'Categories'),
          const SizedBox(height: 15),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (var name in DummyData().categories)
                ChipButton(
                  label: name,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
