import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/current_route.dart';
import 'package:flutter_template/core/utils/router/extract_unknown_url.dart';

class GoRouterObserver extends NavigatorObserver {

  final Ref ref;

  GoRouterObserver({required this.ref});

  void _updateCurrentRoute(Route? route) {

    WidgetsBinding.instance.addPostFrameCallback((_) {

      String path = "/";

      if(route!.settings.name != null){

        path = route.settings.name!;

      }else{

       if(route.settings.arguments == null){

        return;

       }

        path = extractPath(input:route.settings.toString())!;

      }
      
      ref.read(currentRouteProvider.notifier).state = path;
      
    });
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _updateCurrentRoute(route);  
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _updateCurrentRoute(previousRoute); 
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _updateCurrentRoute(newRoute); 
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _updateCurrentRoute(previousRoute ?? route);
  }
}
