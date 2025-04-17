import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditRow extends StatelessWidget {

  const EditRow({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        spacing: 5,
        children: [
          EditButton(),
          ExpandRow(),
        ],
      ),
    );

  }

}

class ExpandRow extends StatelessWidget {

  const ExpandRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(4)
      ),
      child:Icon(
        Icons.arrow_drop_down_rounded, 
        color: Colors.black
      ),
    );
  }

}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
           color: Colors.grey.withAlpha(50),
        ),
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(
        "Editar",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 13,
        )
      ),
    );

  }
}