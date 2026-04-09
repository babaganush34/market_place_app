import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:market_place_app/core/di/inject_module.config.dart';
import 'package:market_place_app/core/di/inject_module.dart';
import 'package:market_place_app/core/router/app_router.dart';
import 'package:market_place_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

final talker = Talker(
  settings: TalkerSettings(enabled: true, useConsoleLogs: true),
  logger: TalkerLogger(
    settings: TalkerLoggerSettings(
      maxLineWidth: 120,
      enableColors: true,
      enable: true,
    ),
  ),
);

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await configureDependencies();
  getIt.registerSingleton<Talker>(talker);
  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: TalkerBlocLoggerSettings(
      enabled: true,
      printEvents: true,
      printTransitions: true,
      printChanges: true,
      printClosings: true,
      printCreations: true,
    ),
  );
  runApp(
    BlocProvider(
      create: (_) => getIt<AuthBloc>()..add(AppStartedEvent()),
      child: MyApp(),
    ),
  );
}

Future<void> configureDependencies() async {
  try {
    getIt.init();
    talker.verbose('Dependencies initialized successfully!');
  } catch (e, st) {
    talker.handle(e, st, 'Dependency Injection Error');
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _router = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
    );
  }
}
