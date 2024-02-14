import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_template/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:flutter_template/helpers/meesages_app_helper.dart';
import 'package:flutter_template/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class LastStep extends StatefulWidget {
  final PageController pageController;
  const LastStep({super.key, required this.pageController});

  @override
  State<LastStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<LastStep>
    with AutomaticKeepAliveClientMixin {
  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    super.build(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, registerState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Themes.primary, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Regresar",
                        style: GoogleFonts.quicksand(color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Por ultimo una contraseña",
                    style:
                        GoogleFonts.quicksand(color: Colors.grey, fontSize: 18),
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    "Crea tu contraseña",
                    style: GoogleFonts.quicksand(
                        color: Colors.black, fontSize: 30),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          enableSuggestions: false,
                          validator: _passwordValidatorComplete,
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .red), // Color del borde cuando está enfocado
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .red), // Color del borde cuando está enfocado
                            ),
                            labelText: 'Crear contraseña',

                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 0), // Ajusta el padding del label
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(
                                      .2)), // Color del borde cuando está enfocado
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(
                                      .2)), // Color del borde cuando no está enfocado
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          style: GoogleFonts.quicksand(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                          validator: (value) {
                            if (value == null) return null;
                            if (value.isEmpty) {
                              return 'No puede estar vacío';
                            }
                            if (value != passwordController.text.trim()) {
                              return "Las contraseñas no coinciden";
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          enableSuggestions: false,
                          enableInteractiveSelection: false,
                          decoration: InputDecoration(
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .red), // Color del borde cuando está enfocado
                            ),
                            focusedErrorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .red), // Color del borde cuando está enfocado
                            ),
                            labelText: 'Confirmar contraseña',

                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 0), // Ajusta el padding del label

                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(
                                      .2)), // Color del borde cuando está enfocado
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(
                                      .2)), // Color del borde cuando no está enfocado
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            PasswordRequiredWidget(
                              state: passwordController.text.trim().length >= 8,
                              titulo: "Minimo 8 caracteres",
                            ),
                            PasswordRequiredWidget(
                              titulo: "Al menos una letra mayuscula",
                              state: contieneMayuscula(
                                  password: passwordController.text.trim()),
                            ),
                            PasswordRequiredWidget(
                              state: contieneNumero(
                                  password: passwordController.text.trim()),
                              titulo: "Al menos un caracter numerico",
                            ),
                            PasswordRequiredWidget(
                              state: contieneCaracterEspecial(
                                  password: passwordController.text.trim()),
                              titulo:
                                  "Al menos un caracter especial - @ \$ & % # _ !",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SlideInRight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: AnimatedSize(
                                duration: const Duration(milliseconds: 200),
                                child: SizedBox(
                                  height: 50,
                                  width: state is AuthLoading
                                      ? 50
                                      : context.width - 40,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          backgroundColor: Themes.primary,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      onPressed: () {
                                        FocusScope.of(context).unfocus();
                                        setState(() {});

                                        if (formKey.currentState!.validate()) {
                                          authBloc.add(LoginGuest(
                                              email: registerState.email,
                                              firstName: registerState.name,
                                              fatherLastName:
                                                  registerState.fatherLastName,
                                              motherLastName:
                                                  registerState.motherLastName,
                                              phone: registerState.phoneNumber,
                                              password: passwordController.text
                                                  .trim()));
                                        } else {
                                          AppMessages.showSnackBar(
                                              context: context,
                                              message: "Campos invalidos.",
                                              backgroundColor: Colors.red);
                                        }
                                      },
                                      child: state is AuthLoading
                                          ? const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 25,
                                                  height: 25,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 1,
                                                  ),
                                                )
                                              ],
                                            )
                                          : Text(
                                              'Finalizar',
                                              style: GoogleFonts.quicksand(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            )),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  bool contieneMayuscula({required String password}) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool contieneMinuscula({required String password}) {
    return password.contains(RegExp(r'[A-Z]'));
  }

  bool contieneNumero({required String password}) {
    return RegExp(r'\d').hasMatch(password);
  }

  bool contieneCaracterEspecial({required String password}) {
    return RegExp(r'[.\-@$&!%#]').hasMatch(password);
  }

  String? _passwordValidatorComplete(String? value) {
    if (value!.isEmpty) return "Ingrese una contrseña";
    final password = value.trim();

    if (password.length < 8) {
      return "Minimo 8 caracteres";
    } else {
      if (contieneMayuscula(password: password) &&
          contieneMinuscula(password: password)) {
        if (contieneNumero(password: password)) {
          if (contieneCaracterEspecial(password: password)) {
            return null;
          } else {
            return "Al menos un caracter especial - , . , \$ , & , @ , % , # ";
          }
        } else {
          return "Al menos un numero";
        }
      } else {
        return "Al menos un caracter MAYUSCULO";
      }
    }
  }
}

class PasswordRequiredWidget extends StatelessWidget {
  final String titulo;
  final bool state;
  const PasswordRequiredWidget({
    super.key,
    required this.titulo,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: state ? Colors.black : Colors.red,
                borderRadius: BorderRadius.circular(100)),
            child: Icon(
              state ? Icons.check : Icons.close,
              color: Colors.white,
              size: 11,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            titulo,
            style: GoogleFonts.quicksand(color: Colors.black, fontSize: 14),
          )
        ],
      ),
    );
  }
}
