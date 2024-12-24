import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrLabel extends StatelessWidget {

  const OrLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 15
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: Colors.white..withValues(alpha: .2),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Text("Or",
              style: GoogleFonts.quicksand(
                color: Colors.white
              )
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: Colors.white.withValues(alpha: .2),
            ),
          ),
        ],
      ),
    );
  }

}