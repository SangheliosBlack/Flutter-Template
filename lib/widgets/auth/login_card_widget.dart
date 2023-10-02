import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/blocs/auth_bloc/auth_bloc.dart';
import 'package:skeleton/helpers/extensions.dart';
import 'package:skeleton/themes/main_theme.dart';
import 'package:skeleton/widgets/auth/pass_field_widget.dart';
import 'package:skeleton/widgets/auth/username_field_widget.dart';


class LoginCard extends StatefulWidget {
  const LoginCard({
    super.key,
  });

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  late final TextEditingController _emailController;
  late final TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();
  final focus = FocusNode();

  @override
  void initState() {
    _emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    UsernameFieldWidget(
                      controller: _emailController,
                      key: const Key('username-field'),
                      focus: focus,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    PassFieldWidget(
                      controller: passwordController,
                      key: const Key('password-field'),
                      labelText: 'Contraseña',
                      focus: focus,
                      formKey: _formKey,
                      emailController: _emailController,
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Olvidaste tu contraseña?",
                    style: GoogleFonts.quicksand(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SlideInRight(
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () async {
                      FocusScope.of(context).unfocus();
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      await Future.delayed(const Duration(milliseconds: 300));
                      authBloc.add(
                        LoginEvent(
                          username: _emailController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 40,
                      width: context.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            width:
                                state is AuthLoading ? 45 : context.width - 40,
                            key: const Key('login-button'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    state is AuthLoading ? 100 : 20),
                                color: Themes.primary.withOpacity(
                                    passwordController.text.trim().isEmpty
                                        ? .2
                                        : 1)),
                            duration: const Duration(milliseconds: 300),
                            child: Center(
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 200),
                                child: state is AuthLoading
                                    ? const SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 1,
                                        ),
                                      )
                                    : Text(
                                        'INICIAR SESION',
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
