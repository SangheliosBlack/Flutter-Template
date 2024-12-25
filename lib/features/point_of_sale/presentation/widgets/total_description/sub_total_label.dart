import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/labels/currency_text.dart';

class SubTotalLabel extends StatelessWidget {

  const SubTotalLabel({super.key});


  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Subtotal",
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 12
          ),
        ),
        CurrencyText(
          price: 100,
          textStyle: GoogleFonts.poppins(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w600
          ),
        ),
        
      ],
    );

  }

}