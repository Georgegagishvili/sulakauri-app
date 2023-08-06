import 'package:flutter/material.dart';
import 'package:sulakauri/pages/book/widgets/book_author.dart';
import 'package:sulakauri/pages/book/widgets/book_cover_text.dart';
import 'package:sulakauri/pages/book/widgets/book_description.dart';
import 'package:sulakauri/pages/book/widgets/book_header.dart';
import 'package:sulakauri/pages/book/widgets/book_recommendations.dart';
import 'package:sulakauri/pages/book/widgets/book_reviews.dart';
import 'package:sulakauri/widgets/appbars/default_appbar.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        title: 'Harry Potter',
      ),
      body: ListView(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.only(
          top: 19,
          left: 20,
          right: 20,
          bottom: 51,
        ),
        children: const [
          BookHeaderBuilder(),
          SizedBox(height: 19),
          BookDescriptionBuilder(),
          SizedBox(height: 29),
          BookCoverTextBuilder(),
          SizedBox(height: 29),
          BookAuthorBuilder(),
          SizedBox(height: 31,),
          BookReviewsBuilder(),
          SizedBox(height: 31,),
          BookRecommendationsBuilder(),
        ],
      ),
    );
  }
}
