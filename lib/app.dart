import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sulakauri/pages/loader.dart';
import 'package:sulakauri/providers/nav_provider.dart';
import 'package:sulakauri/providers/reading_provider.dart';
import 'package:sulakauri/theme/apptheme.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavProvider()),
        ChangeNotifierProvider(create: (_) => ReadingProvider()),
      ],
      builder: (BuildContext context, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.appTheme(),
          home: const LoadingPage(),
        );
      },
    );
  }
}
