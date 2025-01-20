import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusButtonFilter extends StatelessWidget {

  const StatusButtonFilter({super.key});

  @override
  Widget build(BuildContext context) {

    final String text = "Ejemplo";
    final TextStyle textStyle = GoogleFonts.poppins(color: Colors.black);

    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();

    final double textWidth = textPainter.size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Container(
          width: textWidth,
          height: 1,
          color: AppTheme.primary,
        ),
      ],
    );
  }
}
