import 'package:flutter/material.dart';
import 'package:flutter_template/features/shared/presentation/widgets/labels/currency_text.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalLabel extends StatelessWidget {

  const TotalLabel({super.key});

  @override
  Widget build(BuildContext context) {

   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600
          ),
        ),
        CurrencyText(
          price: 100,
          textStyle: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );
  }

}