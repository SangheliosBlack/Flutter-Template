import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_notifier.g.dart';

@riverpod
AppRouterNotifier appRouterNotifier(ref){

  return AppRouterNotifier(ref: ref);

}

class AppRouterNotifier extends ChangeNotifier {

  final Ref <AppRouterNotifier>? ref;

  AuthenticationStatus _authenticationStatus = AuthenticationStatus.checking;

   AppRouterNotifier({this.ref}) {

     ref?.listen<AuthenticationStatus>(authProvider.select((state) => state.authenticationStatus),
      (_, next) {
         debugPrint('AuthenticationStatus changed: $next');
        _authenticationStatus = next;
        notifyListeners();
      },
    );
    
  }

  AuthenticationStatus get authenticationStatus => _authenticationStatus;

  set authenticationStatus(AuthenticationStatus status){

    _authenticationStatus = status;

    notifyListeners();

  }

}