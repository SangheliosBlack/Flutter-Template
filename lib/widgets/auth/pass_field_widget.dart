import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'package:skeleton/blocs/auth_bloc/auth_bloc.dart';
import 'package:skeleton/helpers/extensions.dart';

class PassFieldWidget extends StatefulWidget {
  const PassFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = true,
    required this.focus,
    required this.formKey,
    required this.emailController,
  }) : super(key: key);

  final bool obscureText;
  final TextEditingController emailController;
  final TextEditingController controller;
  final String labelText;
  final GlobalKey<FormState> formKey;
  final FocusNode focus;

  @override
  State<PassFieldWidget> createState() => _PassFieldWidget();
}

class _PassFieldWidget extends State<PassFieldWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * 0.01),
        child: TextFormField(
          autofocus: false,
          focusNode: widget.focus,
          autofillHints: const [AutofillHints.password],
          style: const TextStyle(overflow: TextOverflow.ellipsis),
          controller: widget.controller,
          obscureText: _obscureText,
          maxLines: 1,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          onEditingComplete: () {
            if (!widget.formKey.currentState!.validate()) {
              return;
            }
            authBloc.add(
              LoginEvent(
                username: widget.emailController.text.trim(),
                password: widget.controller.text.trim(),
              ),
            );
            FocusScope.of(context).unfocus();
          },
          validator: _validator,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              fillColor: Colors.transparent,
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              labelText: widget.labelText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.grey.withOpacity(.7)),
              hintText: "Tu contraseña",
              errorStyle: GoogleFonts.quicksand(color: Colors.red),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )
                  : Container()),
        ));
  }

  String? _validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) {
      return 'No puede estar vacío';
    }
    return null;
  }
}
