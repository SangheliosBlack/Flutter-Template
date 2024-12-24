import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AdaptativeTooltip extends StatelessWidget {

  final String label;
  final Widget child;
  final double borderRadius;
  const AdaptativeTooltip({
    super.key,
    required this.label,
    required this.child,
    this.borderRadius = 100
  });


  @override
  Widget build(BuildContext context) {

    return Tooltip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      message: label,
      textStyle: GoogleFonts.quicksand(
        color: Colors.white,
      ),
      preferBelow: false,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: child
    );

  }
  
}