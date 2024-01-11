import 'package:auto_route/auto_route.dart';

import 'package:flutter_template/pages/pages.dart';
import 'package:flutter_template/views/views.dart';

part 'app_routers.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
            page: SplashRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            reverseDurationInMilliseconds: 800,
            durationInMilliseconds: 800,
            initial: true,
            path: '/splash'),
        CustomRoute(
            page: DashboardRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            reverseDurationInMilliseconds: 800,
            durationInMilliseconds: 800,
            children: [
              CustomRoute(
                  page: DashBoardDefaultRoute.page,
                  transitionsBuilder: TransitionsBuilders.fadeIn,
                  reverseDurationInMilliseconds: 800,
                  durationInMilliseconds: 800,
                  path: ''),
            ],
            path: '/dashboard'),
        CustomRoute(
            page: AuthRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            reverseDurationInMilliseconds: 400,
            durationInMilliseconds: 400,
            path: '/auth'),
      ];
}
