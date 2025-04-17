import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/route_observer.dart';
import 'package:flutter_template/core/utils/transitions/custom_transitions.dart';
import 'package:flutter_template/features/features_screens.dart';
import 'package:flutter_template/features/shared/presentation/layouts/point_of_sale_layout.dart';
import 'package:go_router/go_router.dart';

final poNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'PoNavigator');

class PointOfSaleNavigator{



  static routes  (Ref ref) =>  ShellRoute(
     observers: [
      GoRouterObserver(ref: ref),
    ],
    navigatorKey: poNavigationKey,
     pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeInFromCenter(
        state: state,
        context: context,
        child: PointOfSaleLayout(child: child)
      );
    },
    routes: [
      GoRoute(
        path: PoHomeScreen.path,
        name: PoHomeScreen.path,
        builder: (_,__) => PoHomeScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const PoHomeScreen()
          );
        },
      ),
      GoRoute(
        path: SalesScreen.path,
        name: SalesScreen.path,
        builder: (_,__) => SalesScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const SalesScreen()
          );
        },
      ),
      GoRoute(
        path: ClientsScreen.path,
        name: ClientsScreen.path,
        builder: (_,__) => SalesScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const ClientsScreen()
          );
        },
      ),
    ]
  );

}
