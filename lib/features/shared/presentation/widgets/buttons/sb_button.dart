import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SbButton extends StatelessWidget {

  final Color color;
  final VoidCallback? onTap;
  final String title;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;

  const SbButton({
    super.key,
    required this.onTap,
    required this.title,
    this.color = Colors.white,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    this.textStyle, 
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 200
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Center(
          child: Text(
            title,
            style: textStyle ?? GoogleFonts.quicksand(
              color: Colors.black,
              fontSize: 12.0,
            )
          ),
        ),
      ),
    );

  }
}