import 'package:flutter_template/features/point_of_sale/point_of_sale.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SelectClientWidget extends ConsumerWidget {

  const SelectClientWidget({super.key});

  @override
  Widget build( BuildContext context,ref ) {

    return Container(
      margin: EdgeInsets.only(
        top: 10,
        left: 15,
        right: 15,
        bottom: 20
      ),
      child: AvatarClientSelector(
        icon: Icons.delivery_dining_sharp,
        isActive: ref.watch(orderCartProvider).deliveyAdded,
        onTap: () {
          
          ref.read(orderCartProvider.notifier).updateDeliveryAdded();
      
        },
      ),
    );

  }

}