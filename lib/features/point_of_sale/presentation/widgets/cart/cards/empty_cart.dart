import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/ui_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCartCard extends StatelessWidget {

  const EmptyCartCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 60
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/empty_cart.png"),
            fit: BoxFit.fitWidth,
          ),
          Text(
            UiConstants.emptyCart,
            overflow: TextOverflow.visible,
            maxLines: 4,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.black
            ),
          ),
        ],
      ),
    );

  }

}