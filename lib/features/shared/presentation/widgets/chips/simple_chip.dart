import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SimpleChip extends StatelessWidget {

  const SimpleChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withValues(alpha: .1)
        ),
        borderRadius: BorderRadius.circular(100)
      ),
      padding: EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 5
      ),
      child: Row(
        spacing: 5,
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle              
            ),
            child: Icon(
              BootstrapIcons.check,
              color: Colors.white,
              size: 10,
            ),
          ),
          Text(
            "Cantidad",
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 10
            )
          ),
          Gap(3)
        ],
      ),
    );
  }
}