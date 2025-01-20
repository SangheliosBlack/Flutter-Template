import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color.fromRGBO(42,98,246	,1);
  static const Color primaryLight = Color.fromRGBO(224, 224, 224, 1);
  static const Color primaryTitle = Color.fromRGBO(117, 117, 117, 1);
  static const Color primaryBody = Color.fromRGBO(247,247,247,1);
  static const Color promaryDark = Color.fromRGBO(35,85,206,1);
  static const Color secondary = Color.fromRGBO(220,231,253	,1);
  static const Color error = Color.fromRGBO(194,63,56,1	);
  //static const Color backgroundColor = Color.fromRGBO(245,246,248,1	);
  static const Color backgroundColor = Color.fromRGBO(239,	239,	239	,1	);
  static const Color delete = Color.fromRGBO(225,80,98	, 1);
  static ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(elevation: 0, color: Colors.white, foregroundColor: Colors.grey),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        titleLarge: GoogleFonts.quicksand(
          color: primaryTitle,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        titleMedium: GoogleFonts.quicksand(
          color: primaryTitle,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        titleSmall: GoogleFonts.quicksand(
          color: primaryTitle,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: GoogleFonts.quicksand(
          color: primaryBody,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
            color: primaryBody,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis),
        bodySmall: TextStyle(
            color: primaryBody,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            overflow: TextOverflow.ellipsis)),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      isDense: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: Colors.grey.withValues(alpha: .05),
      focusColor: Colors.white,
      errorBorder:OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: error,width: 2),
      ), 
      hintStyle: GoogleFonts.poppins(
        color: Colors.black,
        fontWeight: FontWeight.w300
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0),width: 1)
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: error,width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey..withValues(alpha: 0),width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey.withValues(alpha: .1),width: 1)
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey,width: 1)
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
      errorStyle: GoogleFonts.quicksand(color: error),
      labelStyle: GoogleFonts.quicksand(color: AppTheme.primary, fontSize: 17),
      hoverColor: Colors.grey.withValues(alpha: .05)
    ),
    iconTheme: IconThemeData(color: primary),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primary,
      // secondary: secondary,
      // brightness: Brightness.light
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0.5,
            backgroundColor: AppTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
  );
}
