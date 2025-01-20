import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/labels/currency_text.dart';

class TaxesLabel extends StatelessWidget {

  const TaxesLabel({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Impuestos",
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 15
          ),
        ),
        CurrencyText(
          price: 100,
          textStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.w600
          ),
        ),
      ],
    );

  }
  
}