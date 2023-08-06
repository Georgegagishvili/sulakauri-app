import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sulakauri/pages/landing/subpages/top_turners.dart';
import 'package:sulakauri/pages/reading/reading.dart';
import 'package:sulakauri/util/route_animations.dart';
import 'package:sulakauri/widgets/book_cards/detailed_book.dart';
import 'package:sulakauri/widgets/buttons/title_button.dart';

class TopTurnersBuilder extends StatelessWidget {
  const TopTurnersBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TitleButton(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          onClick: () => Navigator.of(context).push(
            SharedAxisRouteAnimations(
              const TopTurnersPage(),
              SharedAxisTransitionType.horizontal,
            ),
          ),
        ),
        const SizedBox(height: 19),
        Flexible(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 13,
            itemBuilder: (BuildContext context, idx) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  SharedAxisRouteAnimations(
                    const ReadingPage(),
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
        ),
      ],
    );
  }
}
