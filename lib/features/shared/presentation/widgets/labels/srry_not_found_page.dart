import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/ui_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class SrryNotFoundPage extends StatelessWidget {

  const SrryNotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Text(
      UiConstants.srryNotFoundPage,
      overflow: TextOverflow.ellipsis,
      maxLines: 3,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        color: Colors.black.withValues(alpha: .8),
        fontSize: 15
      ),
    );

  }

}