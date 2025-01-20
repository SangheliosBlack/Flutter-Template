import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';


class PassFieldWidget extends StatefulWidget {

  const PassFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = true,
    required this.focus,
    required this.formKey,
  });

  final bool obscureText;
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
    
    return TextFormField(
      key: const ValueKey('passwordField'),
      autofocus: false,
      textCapitalization: TextCapitalization.words,
      //focusNode: widget.focus,
      autofillHints: const [AutofillHints.password],
      style: GoogleFonts.poppins(
        color: Colors.black, 
        fontSize: 16,
        fontWeight: FontWeight.w300
      ),
      controller: widget.controller,
      obscureText: _obscureText,
      maxLines: 1,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onEditingComplete: () {

        if (!widget.formKey.currentState!.validate()) {

          return;

        }
        
        //FocusScope.of(context).unfocus();
      },
      validator: _validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: UiConstants.passwordPlaceholder,
        suffixIcon: widget.obscureText
          ? Container(
              padding: EdgeInsets.only(right: 20),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                ),
          )
          : Container()),
    );
  }

  String? _validator(String? value) {

    if (value == null) return null;

    if (value.isEmpty) {

      return UiConstants.passwordRequired;

    }

    if(value.length < 6 || value.length > 16){

      return UiConstants.invalidPassword;

    }

    return null;
  }
}
