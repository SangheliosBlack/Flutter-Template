import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesHeader extends StatelessWidget {

  const CategoriesHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20
      ),
      child: Row(
        children: [
          Text("Categorias",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          ),
          Spacer(),
          Icon(
            BootstrapIcons.three_dots,
            color: Colors.black,
            size: 20,
          )
        ],
      ),
    );

  }

}