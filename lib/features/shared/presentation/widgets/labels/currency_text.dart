import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrencyText extends ConsumerWidget {

  final double price;
  final TextStyle? textStyle;

  const CurrencyText({
    super.key, 
    this.textStyle,
    required this.price
  });

  @override
  Widget build(BuildContext context, ref) {

    final style = textStyle ?? GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: Colors.black
    );

    return Text(
      NumberFormat.currency(
        locale: 'es_MX', symbol: '\$'
      ).format(price), 
      style: style
    );

  }

}
