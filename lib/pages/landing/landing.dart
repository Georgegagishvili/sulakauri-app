import 'package:flutter/material.dart';
import 'package:sulakauri/pages/landing/widgets/from_your_library.dart';
import 'package:sulakauri/pages/landing/widgets/top_turners.dart';
import 'package:sulakauri/widgets/appbars/search_appbar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: const SearchAppbar(),
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(
              bottom: 100,
              top: 22,
            ),
            children: const [
              FromYourLibraryBuilder(),
              SizedBox(height: 23),
              TopTurnersBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
