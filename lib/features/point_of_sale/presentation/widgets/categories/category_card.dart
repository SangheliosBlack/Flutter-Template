import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {

  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
        vertical: 5
      ),
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          "Categoria",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );

  }

}