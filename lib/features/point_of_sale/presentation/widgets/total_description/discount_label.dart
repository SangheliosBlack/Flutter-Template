import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/labels/currency_text.dart';

class DiscountLabel extends StatelessWidget {

  const DiscountLabel({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Descuento",
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 15
          ),
        ),
        CurrencyText(
          price: 0,
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