import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputText extends StatelessWidget {

  final String labelText;
  final IconData icon;

  const InputText({
    super.key, 
    required this.labelText,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: GoogleFonts.quicksand(
          color: Colors.white
        ), 
        suffixIcon: Container(
          padding: EdgeInsets.only(
            right: 10
          ),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      )
    );
  }
}