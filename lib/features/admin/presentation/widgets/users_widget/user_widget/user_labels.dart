import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserLabels extends StatelessWidget {

  const UserLabels({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          right: 10
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Julio Villargrana Martinez",
              overflow: TextOverflow.ellipsis,
              style:  GoogleFonts.quicksand(
                color: const Color.fromARGB(255, 0, 4, 42),
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            Text(
              "Puesto ",
              style:  GoogleFonts.quicksand(
                color: Colors.black.withAlpha(150),
                fontWeight: FontWeight.w300,
                fontSize: 12
              ),
            )
          ],
        ),
      ),
    );

  }

}