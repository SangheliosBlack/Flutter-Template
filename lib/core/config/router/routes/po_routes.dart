import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final poNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'PoNavigator');

final poRoutes = ShellRoute(
  navigatorKey: poNavigationKey,
  
  routes: [

  ]
);