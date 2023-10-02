import 'package:animate_do/animate_do.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/blocs/auth_bloc/auth_bloc.dart';
import 'package:skeleton/helpers/extensions.dart';
import 'package:skeleton/helpers/meesages_app_helper.dart';
import 'package:skeleton/views/auth/login_view.dart';
import 'package:skeleton/views/auth/presentation_view.dart';
import 'package:skeleton/views/auth/register_view.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            AppMessages.showSnackBar(context: context, message: state.message);
          } else if (state is AuthSuccess) {
            context.router.replaceNamed('/dashboard');
          }
        },
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                width: context.width,
                height: context.height,
                child: const Image(
                  image: AssetImage(
                    "assets/images/background.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              SlideInUp(
                child: Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: context.width,
                    height: context.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 35),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(-15, -15),
                                ),
                              ],
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Column(
                            children: [
                              Text(
                                "Bienvenido a",
                                style:
                                    GoogleFonts.quicksand(color: Colors.black),
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
                              ExpandablePageView(
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
                                  RegisterView(
                                    pageController: pageController,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
