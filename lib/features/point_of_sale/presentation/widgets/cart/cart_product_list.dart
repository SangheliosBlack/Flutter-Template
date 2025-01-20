import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/cart.dart';

class CartProductList extends ConsumerWidget {

  const CartProductList({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final productsList = ref.watch(orderCartProvider).productList;

    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            top: 15
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          child: productsList.isEmpty 
          ? EmptyCartCard()
          : Align(
            alignment: Alignment.topCenter,
            child: ListView.separated(
             
              shrinkWrap: true,
              itemBuilder: (_, index) { 

                final product = productsList.values.elementAt(index);
            
                return CartProductItem(product: product);
            
              }, 
              separatorBuilder: (_,__) => Divider(
                color: Colors.black.withAlpha(10),
                height: 16,
              ), 
              itemCount: productsList.length,
            ),
          ),
        ),
      ),
    );

  }

}