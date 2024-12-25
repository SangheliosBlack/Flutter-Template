import 'package:flutter/material.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/features/auth/application/providers/auth_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router_notifier.g.dart';

@riverpod
AppRouterNotifier appRouterNotifier(ref){

  return AppRouterNotifier(ref: ref);

}

class AppRouterNotifier extends ChangeNotifier {

  final AutoDisposeProviderRef <AppRouterNotifier>? ref;

  AuthenticationStatus _authenticationStatus = AuthenticationStatus.checking;

   AppRouterNotifier({this.ref}) {

    ref?.listen(authControllerProvider, (previous, next) {
      _authenticationStatus = next.authenticationStatus;
    });

  }

  AuthenticationStatus get authenticationStatus => _authenticationStatus;

  set authenticationStatus(AuthenticationStatus status){

    _authenticationStatus = status;

    notifyListeners();

  }

}