import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/categories/categories.dart';

class CategoriesWidget extends StatelessWidget {

  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      spacing: 5,
      children: [
        CategoriesHeader(),
        CategoryList()
      ],
    );

  }

}