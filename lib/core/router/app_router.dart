import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:market_place_app/core/router/talker_page/talker_page.dart';
import 'package:market_place_app/features/auth/presentation/pages/auth_page.dart';
import 'package:market_place_app/features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@lazySingleton
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: TalkerRoute.page),
    // AutoRoute(page: RickDetailRoute.page),
  ];
}
