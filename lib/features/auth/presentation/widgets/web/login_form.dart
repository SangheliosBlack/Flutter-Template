import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/auth/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends ConsumerWidget {

  final GlobalKey<FormState> formKey;


  const LoginForm({
    super.key,
    required this.formKey,
  });


  @override
  Widget build(BuildContext context, ref) {
    
    final authState = ref.watch(authProvider);

    final focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 00, vertical: 5),
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Correo electronico",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  )
                ),
                UsernameFieldWidget(
                  controller: authState.emailController!,
                  key: const Key('username-field'),
                  focus: focusNode,
                ),
                Text("Contraseña",
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                  )
                ),
                PassFieldWidget(
                  controller: authState.passwordController!,
                  key: const Key('password-field'),
                  labelText: 'Contraseña',
                  focus: focusNode,
                  formKey: formKey,
                ),
              ],
            )
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AdaptativeTooltip(
              label: "Proximamente",
              child: AdaptativeGesture(
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Olvidaste tu contraseña?",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );

  }

}