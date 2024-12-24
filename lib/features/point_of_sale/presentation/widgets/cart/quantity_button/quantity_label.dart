import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityLabel extends StatelessWidget {

  const QuantityLabel({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10
      ),
      child: Text(
        "2", 
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 12
        )
      ),
    );

  }

}