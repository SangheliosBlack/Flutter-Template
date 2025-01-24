import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/layouts/auth_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/features/features_screens.dart';

import '../../../utils/transitions/custom_transitions.dart';

final authNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'AuthNavigator');

class AuthNavigator{

  static routes (Ref ref) => ShellRoute(
    navigatorKey: authNavigatorKey,
    pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeInFromCenter(
        state: state,
        context: context,
        child: AuthLayout(child: child)
      );
    },
    builder: (_,__,child) => AuthLayout(child: child),
    routes: [
      GoRoute(
        path: PresentationScreen.path,
        name: PresentationScreen.path,
        builder: (_,__) => PresentationScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: const PresentationScreen()
          );
        },
      ),
      GoRoute(
        path: LoginScreen.path,
        name: LoginScreen.path,
        builder: (_,__) => LoginScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeInFromCenter(
            state: state,
            context: context,
            child: LoginScreen()
          );
        },
      ),
    ]
  );

}


