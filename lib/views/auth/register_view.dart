import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/helpers/extensions.dart';
import 'package:skeleton/helpers/meesages_app_helper.dart';
import 'package:skeleton/themes/main_theme.dart';
import 'package:skeleton/widgets/auth/text_field_widget.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController firstNameController;
  late TextEditingController lastNameNameController;
  late TextEditingController secondLasNameController;
  late TextEditingController passController;
  late TextEditingController confirmPassController;
  bool check = false;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameNameController = TextEditingController();
    secondLasNameController = TextEditingController();
    passController = TextEditingController();
    confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameNameController.dispose();
    secondLasNameController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldWidget(
                        controller: firstNameController,
                        labelText: 'Nombre',
                        keyboardType: TextInputType.text,
                      ),
                      Row(mainAxisSize: MainAxisSize.max, children: [
                        Flexible(
                          child: TextFieldWidget(
                            controller: lastNameNameController,
                            labelText: 'Apellido Paterno',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Flexible(
                          child: TextFieldWidget(
                            controller: secondLasNameController,
                            labelText: 'Apellido Materno',
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ]),
                      TextFieldWidget(
                        controller: secondLasNameController,
                        labelText: 'Correo electronico',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      /*PassFieldWidget(
                        obscureText: false,
                        controller: passController,
                        labelText: 'Contraseña',
                        focus: FocusNode(),
                      ),
                      PassFieldWidget(
                        controller: confirmPassController,
                        labelText: 'Confirmar contraseña',
                        focus: FocusNode(),
                      )*/
                    ],
                  ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Switch.adaptive(
                  activeColor: Themes.primary,
                  value: check,
                  onChanged: (value) => setState(() {
                    check = value;
                  }),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => AppMessages.showAlertWithoutActions(
                        context: context,
                        title: const Text('Resgistrarse'),
                        content: const Text(
                          'Terminos, condiciones y Politíca de privacidad ',
                          style: TextStyle(overflow: TextOverflow.clip),
                        )),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: 'Acepto',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  color: Themes.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text:
                                  ' terminos, condiciones y Politíca de privacidad',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 11,
                                    overflow: TextOverflow.clip,
                                  ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SlideInRight(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: context.width,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    action() {
                      context.router.pushNamed('/login');
                    }

                    AppMessages.showAlertWithoutActions(
                        context: context,
                        title: const Text('Registrarse'),
                        content:
                            const Text('Bienvenido, Te registraste con éxito!'),
                        action: action);
                  },
                  child: Text(
                    'REGISTRARME',
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Ya tienes una cuenta?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
                onPressed: () {
                  widget.pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear);
                },
                child: Text(
                  'Iniciar Sesion',
                  style: GoogleFonts.quicksand(
                      color: Themes.primary, fontWeight: FontWeight.w600),
                ))
          ]),
        ],
      ),
    );
  }
}
