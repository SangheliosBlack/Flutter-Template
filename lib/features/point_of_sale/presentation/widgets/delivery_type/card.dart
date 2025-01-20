import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

class PaymentMethodCard extends StatelessWidget {

  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 75,
        padding: EdgeInsets.symmetric(
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DeliveryMethodList(),
          Gap(10),
        ],
      ),
    );

  }

}