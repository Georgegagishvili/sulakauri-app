import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sulakauri/theme/apptheme.dart';
import 'package:sulakauri/util/dummy_data.dart';
import 'package:sulakauri/widgets/other/rating.dart';

class _BookRecommendationsBuilderState
    extends State<BookRecommendationsBuilder> {
  int page = 0;
  List<String> images =
      List.generate(15, (index) => DummyData().getRandomBookCover);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Peoples Also Viewed',
          style: AppTheme.eighteen,
        ),
        const SizedBox(height: 19),
        CarouselSlider.builder(
          itemCount: 7,
          itemBuilder: (_, idx, realIdx) {
            return _sliderItem(idx);
          },
          options: CarouselOptions(
            aspectRatio: 2,
            enlargeCenterPage: false,
            viewportFraction: 0.44,
            clipBehavior: Clip.none,
            enableInfiniteScroll: false,
            initialPage: 1,
            height: 280,
            padEnds: false,
            onPageChanged: (v, _) {
              setState(
                () {
                  page = v;
                },
              );
            },
          ),
        )
      ],
    );
  }

  Widget _sliderItem(idx) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 196,
            width: 144,
            color: AppTheme.silver,
            child: Image.network(
              images[idx],
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Text(
          'Harry potter',
          style: AppTheme.sixteen,
        ),
        const SizedBox(height: 2),
        const RatingBuilder(rating: 4),
        const SizedBox(height: 4),
        Text(
          '\$3.44',
          style: AppTheme.sixteen.copyWith(
            color: AppTheme.darkOrange,
          ),
        )
      ],
    );
  }
}

class BookRecommendationsBuilder extends StatefulWidget {
  const BookRecommendationsBuilder({Key? key}) : super(key: key);

  @override
  State<BookRecommendationsBuilder> createState() =>
      _BookRecommendationsBuilderState();
}
