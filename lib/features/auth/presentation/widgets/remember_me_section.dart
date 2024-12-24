import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RememberMe extends StatelessWidget {
  const RememberMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox(
                value: false,
                checkColor: Colors.white,
                fillColor: WidgetStateProperty.resolveWith((states) => Colors.white),
                onChanged: (value){

                }
              ),
              Text("Recordarme",
                style: GoogleFonts.quicksand(
                  color: Colors.white.withValues(alpha: 1),
                )
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(right: 10),
          child: Text("Olvide mi contraseña?",
            style: GoogleFonts.quicksand(
              color: Colors.white.withValues(alpha: 1),
              decoration: TextDecoration.underline,
              decorationColor: Colors.white
            )
          ),
        )
      ],
    );
  }
}