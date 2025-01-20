import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/domain/domain.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';

class DecreaseButton extends ConsumerWidget {

  final ProductEntity product;

  const DecreaseButton({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

        final int newQuantity = product.quantity - 1;

        if(newQuantity == 0){

          ref.read(orderCartProvider.notifier).removeProduct(product: product);
          return;

        }

        ref.read(orderCartProvider.notifier).updateProductQuantity(
          product:product,
          quantity: newQuantity
        );

      },
      child: AnimatedContainer(
        width: 25,
        height: 25,
        duration: Duration(
          milliseconds: 300
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: product.quantity == 1 ? AppTheme.delete : Colors.grey
        ),
        child: Center(
          child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: product.quantity == 1 
              ? Container(
                padding: EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 4.5
                ),
                child: Icon(
                  BootstrapIcons.trash,
                  size: 12,
                  color: Colors.white,
                ),
              ) 
              : Icon(
                BootstrapIcons.dash,
                color: Colors.white,
              ),
            )
        )
      ),
    );

  }

}