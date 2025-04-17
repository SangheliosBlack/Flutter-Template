import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/account_menu/header_menu/printer_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderAccountMenu extends StatelessWidget {

  const HeaderAccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Cuenta",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          ),
          PrinterWidget()
        ],
      ),
    );
  }

}