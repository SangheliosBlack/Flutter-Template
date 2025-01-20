import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSales extends StatelessWidget {

  const HeaderSales({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7
      ),
      child: Row(
        children: [
          Text(
            "Ventas",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );

  }

}