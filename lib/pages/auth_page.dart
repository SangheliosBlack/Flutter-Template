import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_template/views/auth/register_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_template/helpers/meesages_app_helper.dart';
import 'package:flutter_template/views/auth/login_view.dart';
import 'package:flutter_template/views/auth/presentation_view.dart';

import 'package:flutter_template/injection_container.dart' as di;

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<RegisterBloc>()),
      ],
      child: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: false,
          top: true,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  AppMessages.showSnackBar(
                      context: context, message: state.message);
                } else if (state is AuthSuccess) {
                  if (state.usuario.role == "ADMIN") {
                    context.router.replaceNamed('/admin');
                  } else {
                    context.router.replaceNamed('/dashboard');
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Bienvenido a",
                      style: GoogleFonts.quicksand(color: Colors.black),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 195,
                      height: 55,
                      child: SvgPicture.asset(
                        fit: BoxFit.contain,
                        'assets/svg/name_app.svg',
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: PageView(
                        onPageChanged: (value) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Presentation(
                            pageController: pageController,
                          ),
                          LoginView(
                            pageController: pageController,
                          ),
                          RegisterPage(
                            pageController: pageController,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
