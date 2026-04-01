import 'package:auto_route/auto_route.dart';
import 'package:market_place_app/features/detail_product/presentation/detail_product_page.dart';
import 'package:market_place_app/features/home/presentation/pages/home_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    // AutoRoute(page: RickDetailRoute.page),
  ];
}
