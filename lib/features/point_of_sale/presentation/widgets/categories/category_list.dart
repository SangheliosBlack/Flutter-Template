import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/categories/categories.dart';
import 'package:gap/gap.dart';

class CategoryList extends StatelessWidget {

  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        
        shrinkWrap: true,
        itemBuilder: (_, i) {  
      
          return CategoryCard();
      
        }, 
        separatorBuilder: (_,__) => Gap(15), 
        itemCount: 15,
      ),
    );

  }

}