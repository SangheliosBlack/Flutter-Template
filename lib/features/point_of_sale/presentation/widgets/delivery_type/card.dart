import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodCard extends StatelessWidget {

  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text("Tipo de venta",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 20,
              fontWeight: FontWeight.w600
            ),
          ),
          Gap(10),
          DeliveryMethodList(),
          Gap(15),
        ],
      ),
    );

  }

}