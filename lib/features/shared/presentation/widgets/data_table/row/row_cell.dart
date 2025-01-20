import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowCell extends StatelessWidget {

  final String text;
  final Color? cellBackgroundColor;
  final double? width;
  final Alignment alignment;

  const RowCell({
    super.key,
    this.width,
    this.cellBackgroundColor = Colors.white,
    this.alignment = Alignment.centerLeft,
    required this.text
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
        decoration: BoxDecoration(
          color: cellBackgroundColor
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 1
        ),
        alignment: alignment,
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300
            )
          )
      ),
    );

  }
  
}