import 'package:flutter/material.dart';
import 'package:market_place_app/core/di/inject_module.dart';
import 'package:market_place_app/core/router/app_router.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}
