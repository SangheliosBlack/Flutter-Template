import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWiget extends ConsumerWidget {

  const LogoWiget({super.key});

  @override
  Widget build(BuildContext context,ref) {


    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width:40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            "TEST",
            style: GoogleFonts.quicksand(
              color: Colors.white,
              fontSize: 18
            ),
          ),
        ),
      ),
    );

  }

}