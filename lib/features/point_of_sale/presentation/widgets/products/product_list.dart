import 'package:flutter/material.dart';

import 'product_card.dart';

class ProductsGrid extends StatelessWidget {

  const ProductsGrid({super.key});


  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, i) {
    
        return ProductCard();
    
      },
      itemCount: 15,
    );

  }

}