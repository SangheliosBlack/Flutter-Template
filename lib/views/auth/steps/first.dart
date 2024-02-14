import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/register_bloc/register_bloc.dart';
import 'package:flutter_template/helpers/meesages_app_helper.dart';
import 'package:flutter_template/themes/main_theme.dart';
import 'package:flutter_template/views/terminos_condiciones.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstStep extends StatefulWidget {
  final PageController pageController;
  final PageController pastController;
  const FirstStep(
      {super.key, required this.pageController, required this.pastController});

  @override
  State<FirstStep> createState() => _FirstStepState();
}

class _FirstStepState extends State<FirstStep>
    with AutomaticKeepAliveClientMixin {
  final formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController lastName2Controller;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);

    registerBloc.add(const EditRegisterEvent(
        fatherLastName: "",
        motherLastName: "",
        name: "",
        email: "",
        phoneNumber: "",
        password: ""));
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    lastName2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    lastName2Controller.dispose();
    super.dispose();
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    super.build(context);
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          widget.pastController.animateToPage(1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Themes.primary, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Iniciar sesion",
                        style: GoogleFonts.quicksand(color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
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
                                controller: nameController,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                textInputAction: TextInputAction.next,
                                style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Nombre invalido";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.name,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(
                                      r'[a-zA-Z\s]')), // Solo letras permitidas
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Nombre (s)',

                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal:
                                          0), // Ajusta el padding del label
                                  // Color del texto de la etiqueta
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(
                                            .2)), // Color del borde cuando está enfocado
                                  ),
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
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Apellido invalido";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: lastNameController,
                                style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                                keyboardType: TextInputType.name,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(
                                      r'[a-zA-Z]')), // Solo letras permitidas
                                ],
                                decoration: InputDecoration(
                                  labelText: 'Primer apellido',

                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal:
                                          0), // Ajusta el padding del label

                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(
                                            .2)), // Color del borde cuando está enfocado
                                  ),
                                  focusedErrorBorder:
                                      const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .red), // Color del borde cuando está enfocado
                                  ),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .red), // Color del borde cuando está enfocado
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
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Apellido invalido";
                                  } else {
                                    return null;
                                  }
                                },
                                textCapitalization: TextCapitalization.words,
                                controller: lastName2Controller,
                                keyboardType: TextInputType.name,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(
                                      r'[a-zA-Z]')), // Solo letras permitidas
                                ],
                                style: GoogleFonts.quicksand(
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Segundo apellido',

                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10.0,
                                      horizontal:
                                          0), // Ajusta el padding del label

                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(
                                            .2)), // Color del borde cuando está enfocado
                                  ),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch.adaptive(
                                    activeColor: Themes.primary,
                                    value: check,
                                    onChanged: (value) => setState(() {
                                      check = value;
                                    }),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.white,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return const TerminosCondicionesView();
                                            });
                                      },
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                            text: 'Acepto',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                  color: Themes.primary,
                                                  fontSize: 14,
                                                ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    ' terminos, condiciones y Politíca de privacidad',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontSize: 14,
                                                      overflow:
                                                          TextOverflow.clip,
                                                    ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
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
                                if (!check) {
                                  AppMessages.showSnackBar(
                                      context: context,
                                      message:
                                          "Acepte termino y condiciones para continuar.",
                                      backgroundColor: Colors.red);
                                } else {
                                  registerBloc.add(EditRegisterEvent(
                                    name: nameController.text.trim(),
                                    email: state.email,
                                    phoneNumber: state.phoneNumber,
                                    password: state.password,
                                    fatherLastName:
                                        lastNameController.text.trim(),
                                    motherLastName:
                                        lastName2Controller.text.trim(),
                                  ));
                                  widget.pageController.animateToPage(1,
                                      duration:
                                          const Duration(milliseconds: 200),
                                      curve: Curves.linear);
                                }
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
