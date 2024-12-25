import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterAccountButton extends StatelessWidget {

  const RegisterAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
      
    return  Container(
      padding: EdgeInsets.symmetric(
        vertical: 20
      ),
      child: Center(
        child: RichText(
        text: TextSpan(
          text: '¿No tienes cuenta aún? ',
          style: GoogleFonts.quicksand(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: 'Regístrate',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold, // Negrita
              ),
              ),
          ],
        ),
          ),
      ),
    );

  }

}