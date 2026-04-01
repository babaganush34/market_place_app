import 'package:flutter/material.dart';
import 'package:market_place_app/core/di/inject_module.dart';
import 'package:market_place_app/features/home/presentation/pages/home_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Market Place', home: const HomePage());
  }
}
