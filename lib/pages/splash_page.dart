import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeleton/blocs/auth_bloc/auth_bloc.dart';
import 'package:skeleton/themes/main_theme.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) context.router.replaceNamed('/auth');
        if (state is AuthSuccess) context.router.replaceNamed('/dashboard');
      },
      child: Scaffold(
        backgroundColor: Themes.primary,
        body: Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            width: 180,
            height: 180,
            child: const FlutterLogo(
              duration: Duration(milliseconds: 1000),
              textColor: Colors.white,
              style: FlutterLogoStyle.horizontal,
              size: 70,
              curve: Curves.bounceOut,
            ),
          ),
        ),
      ),
    );
  }
}
