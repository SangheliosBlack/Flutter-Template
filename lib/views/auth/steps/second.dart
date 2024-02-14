import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_template/helpers/meesages_app_helper.dart';
import 'package:flutter_template/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondStep extends StatefulWidget {
  final PageController pageController;
  const SecondStep({super.key, required this.pageController});

  @override
  State<SecondStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<SecondStep>
    with AutomaticKeepAliveClientMixin {
  final formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    emailController = TextEditingController();
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
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
                          widget.pageController.animateToPage(0,
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
                    "Hola",
                    style: GoogleFonts.quicksand(
                        color: Colors.black, fontSize: 25),
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    state.name,
                    style: GoogleFonts.quicksand(
                        color: Themes.primary, fontSize: 40),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ingresa tu correo electronico y numero telefonico",
                    style:
                        GoogleFonts.quicksand(color: Colors.grey, fontSize: 18),
                    overflow: TextOverflow.visible,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[a-zA-Z0-9@._-]')),
                                ],
                                style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  final RegExp emailRegex = RegExp(
                                      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

                                  if (value!.isEmpty) {
                                    return 'Ingresa un correo electrónico.';
                                  } else if (!emailRegex.hasMatch(value)) {
                                    return 'Ingresa un correo electrónico válido.';
                                  }

                                  return null;
                                },
                                decoration: InputDecoration(
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  labelText: 'Correo electronico',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 0),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(.2)),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(.2)),
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
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                                inputFormatters: [PhoneNumberFormatter()],
                                controller: phoneController,
                                validator: (value) =>
                                    validatePhoneNumber(value!),
                                decoration: InputDecoration(
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .red), // Color del borde cuando está enfocado
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .red), // Color del borde cuando está enfocado
                                  ),
                                  labelText: 'Telefono celular',
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal:
                                          0), // Ajusta el padding del label

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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                registerBloc.add(EditRegisterEvent(
                                    name: state.name,
                                    email: emailController.text.trim(),
                                    phoneNumber: phoneController.text.trim(),
                                    password: state.password,
                                    fatherLastName: state.fatherLastName,
                                    motherLastName: state.motherLastName));
                                widget.pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              } else {
                                AppMessages.showSnackBar(
                                    context: context,
                                    message: "Campos invalidos.",
                                    backgroundColor: Colors.red);
                              }
                              FocusScope.of(context).unfocus();
                            },
                            behavior: HitTestBehavior.translucent,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(.4),
                                            offset: const Offset(4, 3),
                                            blurRadius: 18,
                                            spreadRadius: -2,
                                          ),
                                        ],
                                        border: Border.all(
                                            width: 10, color: Colors.white),
                                        color: Themes.primary,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

String? validatePhoneNumber(String value) {
  RegExp phoneRegex = RegExp(r'^\d{10}$');

  value = value.replaceAll(" ", "");

  if (!phoneRegex.hasMatch(value)) {
    return 'Por favor, ingrese un número de teléfono válido';
  }

  return null;
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final numericOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final formatted = _formatPhoneNumber(numericOnly);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatPhoneNumber(String input) {
    if (input.length < 4) {
      return input;
    } else if (input.length < 7) {
      return '${input.substring(0, 3)} ${input.substring(3)}';
    } else if (input.length >= 10) {
      // Agregamos esta condición
      return '${input.substring(0, 3)} ${input.substring(3, 6)} ${input.substring(6, 10)}';
    } else {
      return '${input.substring(0, 3)} ${input.substring(3, 6)} ${input.substring(6)}';
    }
  }
}
