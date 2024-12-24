import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {

  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: "Buscar..."
                ),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 14
                ),
              )
            ),
            Icon(
              BootstrapIcons.search,
              color: Colors.black,
              size: 20,
            )
          ],
        ),
      ),
    );

  }

}