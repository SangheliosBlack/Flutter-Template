import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {

  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      width: 70,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 45,
            child: Image(
              image: AssetImage("assets/images/category.png"),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Categoria",
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: 10
            ),
          )
        ],
      ),
    );

  }

}