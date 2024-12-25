import 'package:flutter/material.dart';
import 'package:flutter_template/core/resources/data_state.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_provider.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/core/services/navigation_service/navigation_service.dart';
import 'package:flutter_template/features/auth/application/providers/auth_state.dart';
import 'package:flutter_template/features/auth/domain/params/login_params.dart';
import 'package:flutter_template/features/auth/presentation/screen/presentation_screen.dart';
import 'package:flutter_template/features/point_of_sale/presentation/screens/point_of_sale_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'login_user_provider.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)

class AuthController extends _$AuthController{

  @override
  AuthState build() {

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    emailController.addListener(() {
      state = state.copyWith(email: emailController.text);
    });

    passwordController.addListener(() {
      state = state.copyWith(password: passwordController.text);
    });

    _checkAutentication();

    return AuthState(
      emailController: emailController,
      passwordController: passwordController
    );

  }

  Future<void> login() async{

    loadingState();

    final params = LoginParams(email: state.email, password: state.password);

    final useCase = await ref.read(loginUseCaseProvider).call(params: params);

    if(useCase is DataSuccess){

      state = state.copyWith(
        user: useCase.data,
        isLoading: false,
        authenticationStatus: AuthenticationStatus.authenticated
        
      );

      _authenticationNavigate();

    }else{

      state = state.copyWith(
        errorMessage: useCase.error?.message,
        isLoading: false,
      );

    }


  }

  void loadingState() => state = state.copyWith(isLoading: true,errorMessage: "");

  void finishLoading() => state = state.copyWith(isLoading: false);

  bool isFormValid(){

    final emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    final passwordRegExp = RegExp(r'^(?=.*\d{4,})(?=.*[!@#$%^&*]).{5,}$');

    final emailValid = emailRegExp.hasMatch(state.emailController!.text);
    final passwordValid = passwordRegExp.hasMatch(state.passwordController!.text);


    return emailValid && passwordValid;

  }

  Future<void> _checkAutentication() async{

    await Future.delayed(Duration(milliseconds: 800));

    final AuthenticationStatus isAuthenticated = await ref.read(authenticationServiceNotifierProvider.notifier).checkAuthenticationStatus();

    state = state.copyWith(
      authenticationStatus : isAuthenticated
    );

  }

  Future<void> logout() async{

    await ref.read(authenticationServiceNotifierProvider.notifier).logout();

    state.emailController?.clear();
    state.passwordController?.clear();


    state = state.copyWith(
      authenticationStatus: AuthenticationStatus.notAuthenticated
    );

    _authenticationNavigate();

  }

  Future<void> _authenticationNavigate() async{

    final navigate = ref.read(navigationProvider);

    if (state.authenticationStatus == AuthenticationStatus.authenticated) {

      navigate(PointOfSaleScreen.path);

    } else if (state.authenticationStatus == AuthenticationStatus.notAuthenticated) {

      navigate(PresentationScreen.path);

    }


    return;

  }


}