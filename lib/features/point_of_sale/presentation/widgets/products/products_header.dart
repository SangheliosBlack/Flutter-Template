import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsHeader extends StatelessWidget {

  const ProductsHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Todos",
          style: GoogleFonts.poppins(
            color: Colors.black.withValues(alpha: .8),
            fontSize: 15,
            fontWeight: FontWeight.w600
          ),
        ),
        Row(
          spacing: 15,
          children: [
            Text(
              "Ordenado alfabeticamente",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 11,
              ),
            ),
            Icon(
              BootstrapIcons.sort_alpha_down,
              color: Colors.grey,
              size: 20,
            ),
          ],
        )
      ],
    );

  }

}