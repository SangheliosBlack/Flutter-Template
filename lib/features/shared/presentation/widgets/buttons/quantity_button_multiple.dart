import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/product_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class QuantityButtonMultiple extends ConsumerWidget {

  final int quantity;
  final ProductEntity product;
  
  const QuantityButtonMultiple({
    super.key,
    required this.quantity,
    required this.product
  });
  

  @override
  Widget build(BuildContext context,ref) {

    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){

            final int newQuantity = quantity - 1;

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
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
            duration: Duration(milliseconds: 300),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: quantity == 1 
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
                size: 20,
              ),
            )
          ),
        ),
        SizedBox(
          width: 20,
          child: Center(
            child: AnimatedFlipCounter(
              duration: const Duration(milliseconds: 300),
              thousandSeparator: ",",
              value: num.parse(quantity.toString()),
              textStyle: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold
              ),)
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {

            final int newQuantity = quantity + 1;
            
            ref.read(orderCartProvider.notifier).updateProductQuantity(
              product:product,
              quantity: newQuantity
            );

          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black
            ),
            duration: Duration(milliseconds: 300),
            child: Icon(
              BootstrapIcons.plus,
              color: Colors.white,
              size: 20,
            )
          ),
        ),
      ],
    );

  }

}