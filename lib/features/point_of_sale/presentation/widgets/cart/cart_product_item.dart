import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/quantity_button/quantity_button.dart';
import 'package:flutter_template/features/shared/presentation/presentation.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CartProductItem extends StatelessWidget {

  const CartProductItem({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 50,
      child: Row(
        children: [
          AdaptiveImage(
            aspectRatio: 1/1,
            imageUrl: "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/7f17c36b-38db-4d74-8ed4-d3983957a293/Derivates/ab88505f-8375-4990-82fa-864f6bda6ce1.jpg",
            borderRadius: 15,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nombre",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.black.withValues(alpha: .8),
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text(
                          "Descripcion",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,                      
                            fontSize: 10,
                            
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(5),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CurrencyText(
                        price: 100,
                      ),
                      Gap(5),
                      QuantityButton()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );

  }

}