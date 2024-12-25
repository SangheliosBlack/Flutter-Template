import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/products/products.dart';

class ProductsWidget extends StatelessWidget {

  const ProductsWidget({super.key});


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        top: 20
      ),
      child: const Column(
        spacing: 15,
        children: [
          ProductsHeader(),
          ProductsGrid()
        ],
      ),
    );

  }

}