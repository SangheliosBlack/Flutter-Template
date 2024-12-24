import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      margin: EdgeInsets.only(
        top: 40
      ),
      height: 50,
      width: context.width,
      duration: Duration(
        milliseconds: 400,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Text(
          "Iniciar sesion",
          style: GoogleFonts.quicksand(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w300
          ),
        ),
      ),
    );

  }
}