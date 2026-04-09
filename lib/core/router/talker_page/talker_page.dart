import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:market_place_app/core/di/inject_module.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class TalkerPage extends StatelessWidget {
  const TalkerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TalkerScreen(
      talker: getIt<Talker>(),
      theme: const TalkerScreenTheme(
        backgroundColor: Color(0xFF1E1E1E),
      ),
    );
  }
}