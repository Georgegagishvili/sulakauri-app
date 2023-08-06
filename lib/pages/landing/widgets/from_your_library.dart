import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:sulakauri/pages/book/book.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/route_animations.dart';
import 'package:sulakauri/widgets/book_cards/progress_book.dart';

class FromYourLibraryBuilder extends StatelessWidget {
  const FromYourLibraryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: Text(
            'From your library',
            style: AppTheme.twentyFour,
          ),
        ),
        const SizedBox(height: 17),
        SizedBox(
          height: 300,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (BuildContext context, idx) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  SharedAxisRouteAnimations(
                    const BookPage(),
                    SharedAxisTransitionType.horizontal,
                  ),
                ),
                child: const ProgressBookCard(),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(width: 20);
            },
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}
