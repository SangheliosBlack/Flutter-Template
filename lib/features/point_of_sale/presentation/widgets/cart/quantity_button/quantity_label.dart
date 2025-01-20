import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/domain/domain.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityLabel extends StatelessWidget {

  final ProductEntity product;

  const QuantityLabel({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 30,
      padding: EdgeInsets.symmetric(
      ),
      child: Center(
        child: Text(
          product.quantity.toString(), 
          overflow: TextOverflow.visible,
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.w600
          )
        ),
      ),
    );

  }

}