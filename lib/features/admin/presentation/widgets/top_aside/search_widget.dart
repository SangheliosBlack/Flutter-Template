import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {

  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 35,
      width: 350,
      child: TextFormField(
        style:  GoogleFonts.roboto(
          color: Colors.black,
          fontWeight: FontWeight.w300,
          fontSize: 12
        ),
        decoration: InputDecoration(
         disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: .05),width: 0)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: .05)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: .05),width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: .05),width: 0)
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: .05),width: 0)
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20
          ),
          prefixIcon: Icon(
            BootstrapIcons.search,
            color: Colors.black,
            size: 12,
          ),
          fillColor: AppTheme.backgroundColorSencondary,
          hintText: "Buscar",
          hintStyle: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 12
          )
        ),
      ),
    );

  }

}