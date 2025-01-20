import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/constants_data.dart';

import 'product_card.dart';

class ProductsGrid extends StatelessWidget {

  const ProductsGrid({super.key});


  @override
  Widget build(BuildContext context) {

    final productsMocks = ContantsData.productList;

    return GridView.builder(
      padding: EdgeInsets.only(top:10),
      scrollDirection: Axis.vertical, 
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, i) {
    
        final product = productsMocks[i];
    
        return ProductCard(product: product,);
    
      },
      itemCount: productsMocks.length,
    );

  }

}