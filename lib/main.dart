import 'package:flutter/material.dart';
import 'package:sulakauri/app.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
}

void main() {
  init();

  runApp(const MyApp());
}
