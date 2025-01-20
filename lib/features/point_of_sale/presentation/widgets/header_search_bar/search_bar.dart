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
          vertical: 7
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
                  hintText: "Buscar...",
                  fillColor: Colors.grey.withValues(alpha: 0),
                  hintStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 14
                  ),
                ),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 14
                ),
                
                enabled: false,
                
              )
            ),
            Icon(
              BootstrapIcons.search,
              color: Colors.black,
              size: 17,
            )
          ],
        ),
      ),
    );

  }

}