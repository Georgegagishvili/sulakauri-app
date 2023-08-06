import 'package:flutter/material.dart';
import 'package:sulakauri/pages/book_store/widgets/bookstore_horizontal.dart';
import 'package:sulakauri/pages/book_store/widgets/categories_grid.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/widgets/appbars/search_appbar.dart';

class BookStorePage extends StatelessWidget {
  const BookStorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppbar(),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 30,
        ),
        children: const [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Text(
              'For you',
              style: AppTheme.twentyFour,
            ),
          ),
          SizedBox(height: 17),
          BookStoreHorizontalList(),
          SizedBox(height: 23),
          BookStoreHorizontalList(
            title: 'Trending',
          ),
          SizedBox(height: 23),
          BookStoreHorizontalList(
            title: 'Top Turners',
          ),
          SizedBox(height: 23),
          CategoriesGridBuilder(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
