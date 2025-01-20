import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/constants.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

class DeliveryMethodList extends StatelessWidget {

  const DeliveryMethodList({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(  
          horizontal: 15
        ),
        itemBuilder: ( _, index) {
      
          final data = ContantsData.deliveryTypes[index];
      
          return DeliveryMethodButton(
            active: index == 0, 
            data: data
          );
      
        }, 
        separatorBuilder: (_,__) => Gap(15), 
        itemCount: ContantsData.deliveryTypes.length,
      
      ),
    );

  }
  
}