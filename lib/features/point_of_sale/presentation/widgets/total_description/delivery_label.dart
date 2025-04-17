import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/shared/presentation/widgets/labels/currency_text.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryLabel extends ConsumerWidget {

  const DeliveryLabel({super.key});


  @override
  Widget build(BuildContext context,ref) {

    final orderCartState = ref.watch(orderCartProvider).deliveyAdded;

    return AnimatedSize(
      duration: Duration(milliseconds: 200),
      child: Offstage(
        offstage: !orderCartState,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Envio",
              style: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13
              ),
            ),
            CurrencyText(
              price: 30,
              textStyle: GoogleFonts.poppins(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w600
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}