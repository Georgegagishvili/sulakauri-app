import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/dummy_data.dart';
import 'package:sulakauri/widgets/buttons/title_button.dart';

class BookStoreHorizontalList extends StatelessWidget {
  const BookStoreHorizontalList({
    this.books,
    this.title,
    this.onTitleClick,
    Key? key,
  }) : super(key: key);
  final List? books;
  final String? title;
  final VoidCallback? onTitleClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title != null)
          TitleButton(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 15,
            ),
            title: title,
            onClick: onTitleClick,
          ),
        SizedBox(
          height: 160,
          child: ListView.separated(
            itemCount: 20,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, idx) {
              return Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 116,
                    height: 160,
                    color: AppTheme.cultured,
                    child: Image.network(
                      DummyData().getRandomBookCover,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        ),
      ],
    );
  }
}
