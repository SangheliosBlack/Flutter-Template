import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/ui_constants.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFound extends StatelessWidget {
  
  const PageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.height,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25
          ),
          child: FittedBox(
            child: Text(
              UiConstants.notFoundPage404,
              style: GoogleFonts.fjallaOne(
                color: Colors.grey.withValues(),
                fontWeight: FontWeight.bold,
                height: 1,
                fontSize: 280
              ),
            ),
          ),
        ),
      ),
    );
  }
}