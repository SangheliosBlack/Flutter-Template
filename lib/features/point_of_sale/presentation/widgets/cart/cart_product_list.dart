import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/cart.dart';
import 'package:gap/gap.dart';

class CartProductList extends StatelessWidget {

  const CartProductList({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          vertical: 10
        ),
        shrinkWrap: true,
        itemBuilder: (_, index) { 
      
          return CartProductItem();
      
        }, 
        separatorBuilder: (_,__) => const Gap(15), 
        itemCount: 3,
      ),
    );

  }

}