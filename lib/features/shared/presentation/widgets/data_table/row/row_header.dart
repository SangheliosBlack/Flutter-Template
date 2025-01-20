import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowHeader extends StatelessWidget {

  final String title;
  final TextStyle? style;
  final Color? color;
  final double? width;
  final Alignment alignment;

  const RowHeader({
    super.key,
    this.style,
    this.width,
    this.alignment = Alignment.center,
    this.color = Colors.white,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: width ?? double.infinity,
          minWidth: width ?? double.infinity,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 1
        ),
        color: color,
        alignment: alignment,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          title,
          style: style ??  GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.black
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}