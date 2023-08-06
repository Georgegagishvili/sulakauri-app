import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sulakauri/pages/book/book.dart';
import 'package:sulakauri/util/route_animations.dart';
import 'package:sulakauri/widgets/appbars/default_appbar.dart';
import 'package:sulakauri/widgets/book_cards/detailed_book.dart';
import 'package:sulakauri/widgets/textfields/search_textfield.dart';

class _TopTurnersPageState extends State<TopTurnersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppbar(
        title: 'Top Page Turners',
      ),
      body: ListView.separated(
        itemCount: 22,
        padding: const EdgeInsets.all(20),
        itemBuilder: (BuildContext context, idx) {
          if (idx == 0) {
            return const SearchTextField();
          }
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              SharedAxisRouteAnimations(
                const BookPage(),
                SharedAxisTransitionType.scaled,
              ),
            ),
            child: const DetailedBookCard(),
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}

class TopTurnersPage extends StatefulWidget {
  const TopTurnersPage({Key? key}) : super(key: key);

  @override
  State<TopTurnersPage> createState() => _TopTurnersPageState();
}
