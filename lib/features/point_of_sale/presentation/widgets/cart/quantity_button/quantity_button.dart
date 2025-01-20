import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/product_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/quantity_button/decrease_button.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/quantity_button/increase_button.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/quantity_button/quantity_label.dart';

class QuantityButton extends StatelessWidget {

  final ProductEntity product;

  const QuantityButton({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {

    return  Row(
      children: [
        DecreaseButton(product: product),
        QuantityLabel(product: product),
        IncreaseButton(product: product)
      ],
    );

  }

}