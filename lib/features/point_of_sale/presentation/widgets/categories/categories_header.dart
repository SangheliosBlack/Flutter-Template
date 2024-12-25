import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesHeader extends StatelessWidget {

  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return  Row(
      children: [
        Text("Categorias",
          style: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: .8),
            fontSize: 20,
            fontWeight: FontWeight.w600
          ),
        ),
        Spacer(),
        Icon(
          BootstrapIcons.three_dots,
          color: Colors.black,
        )
      ],
    );

  }

}