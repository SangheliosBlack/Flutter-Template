import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/route_observer.dart';
import 'package:flutter_template/core/utils/transitions/custom_transitions.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/features_screens.dart';
import '../../../../features/shared/presentation/layouts/admin_layout.dart';

final adminNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'AdminNavigator');

class AdminNavigator{

  static routes (Ref ref) =>  ShellRoute(
     observers: [
      GoRouterObserver(ref: ref),
    ],
    navigatorKey: adminNavigationKey,
     pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeAndSlideTransition(
        state: state,
        context: context,
        child: AdminLayout(child: child)
      );
    },
    routes: [
      GoRoute(
        path: DefaultAdminScreen.path,
        name: DefaultAdminScreen.path,
        builder: (_,__) => DefaultAdminScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeAndSlideTransition(
            state: state,
            context: context,
            child: const DefaultAdminScreen()
          );
        },
      ),
    ]
  );

}
