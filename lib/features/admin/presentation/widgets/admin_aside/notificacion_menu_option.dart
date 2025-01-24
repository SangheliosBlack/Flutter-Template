import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificacionMenuOption extends StatelessWidget {

  final bool? offstage;

  const NotificacionMenuOption({
    super.key,
    this.offstage
  });

  @override
  Widget build(BuildContext context) {

    return Offstage(
      offstage: offstage ?? false,
      child: Container (
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration( 
          color: AppTheme.primary,
          shape: BoxShape.circle
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 7, 
          vertical: 3
        ),
        child: Text(
          "10",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 12
          ),
        ),
      ),
    );

  }

}