import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/entities.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/sales/sales_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/total_description/total_description_widget.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class AccountMenu extends ConsumerWidget {

  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final orderCartState = ref.watch(orderCartProvider);

    return Container(
      color: Colors.white,
      width: 250,
      margin: EdgeInsets.only(
      ),
      padding: EdgeInsets.only(
        top: 40,
        bottom: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderAccountMenu(),
          CartProductList(),
          TotalDescription(),
          PaymentMethodCard(),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: Button(
              onTap: () { 

                final random = Random();
                
                final id = 10000 + random.nextInt(90000);

                final Sale newSale = Sale(
                  id: id, 
                  cliente: "Nombre del CLi", 
                  total: orderCartState.calculateTotalAmount(), 
                  fecha: DateTime.now()
                );

                ref.read(salesProvider.notifier).addSale(sale: newSale);

                ref.read(orderCartProvider.notifier).cleanOrder();

              },
              borderRadius: 100,
              locked: orderCartState.productList.isEmpty,
              child: Text(
                "Confirmar",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

}