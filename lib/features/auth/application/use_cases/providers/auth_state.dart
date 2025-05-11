import 'package:flutter/material.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/features/auth/domain/entities/user_entity.dart';

class AuthState {

  final bool isLoading;
  final UserEntity? user;
  final String email;
  final String password;
  final String errorMessage;
  final AuthenticationStatus authenticationStatus;

  final TextEditingController? emailController;
  final TextEditingController? passwordController;


  AuthState({
    this.isLoading = false,
    this.user,
    this.email = "",
    this.password = "",
    this.errorMessage = "",
    this.emailController,
    this.passwordController,
    this.authenticationStatus = AuthenticationStatus.checking
  });

  AuthState copyWith({
    bool? isLoading,
    UserEntity? user,
    String? email,
    String? password,
    String? errorMessage,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    AuthenticationStatus? authenticationStatus
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage : errorMessage ?? this.errorMessage,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      authenticationStatus: authenticationStatus ?? this.authenticationStatus
    );
  }

}