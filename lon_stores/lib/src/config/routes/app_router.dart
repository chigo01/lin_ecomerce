import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Tab,Route')
class AppRouter extends $AppRouter {
  final _slideLeft = TransitionsBuilders.slideLeft;
  final _slideUp = TransitionsBuilders.slideBottom;
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CustomerRoute.page,
          initial: true,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: UserRoute.page),
          ],
        ),
        CustomRoute(
          initial: false,
          page: ProductDetailRoute.page,
          transitionsBuilder: _slideLeft,
        ),
        CustomRoute(
          initial: false,
          page: SearchRoute.page,
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
        CustomRoute(
          page: FilterRoute.page,
          transitionsBuilder: _slideLeft,
        ),
        CustomRoute(
          page: AllProductRoute.page,
          transitionsBuilder: _slideUp,
        ),
      ];
}
