import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentUsers extends StatelessWidget {

  const CurrentUsers({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            BootstrapIcons.people_fill,
            color: Color.fromRGBO(35,34,64,1),
            size: 13,
          ),
          Text(
            "65",
            style: GoogleFonts.roboto(
              color: Color.fromRGBO(35,34,64,1),
              fontSize: 12,
              fontWeight: FontWeight.w300
            ),
          ),
        ],
      ),
    );

  }

}
