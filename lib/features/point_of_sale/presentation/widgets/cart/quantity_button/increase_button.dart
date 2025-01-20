import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/domain/domain.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncreaseButton extends ConsumerWidget {

  final ProductEntity product;

  const IncreaseButton({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        ref.read(orderCartProvider.notifier).updateProductQuantity(
          product:product,
          quantity: product.quantity + 1
        );
      },
      child: AnimatedContainer(
        width:  25,
        height: 25,
        duration: Duration(
          milliseconds: 300
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.primary
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.plus,
            size: 10,
            color: Colors.white,
          )
        ),
      ),
    );

  }

}