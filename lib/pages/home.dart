import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sulakauri/pages/book_store/book_store.dart';
import 'package:sulakauri/pages/bookshelf/bookshelf.dart';
import 'package:sulakauri/pages/landing/landing.dart';
import 'package:sulakauri/providers/nav_provider.dart';
import 'package:sulakauri/widgets/bottom_navbar/bottom_navbar.dart';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, navProvider, __) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          bottomNavigationBar: const AppBottomNavBar(),
          body: IndexedStack(
            index: navProvider.getNavIndex,
            children: const [
              LandingPage(),
              BookShelfPage(),
              BookStorePage(),
            ],
          ),
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
