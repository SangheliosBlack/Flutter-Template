import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/product_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/cards/slide_background_card.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/cart/quantity_button/quantity_button.dart';
import 'package:flutter_template/features/shared/presentation/presentation.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CartProductItem extends ConsumerWidget {

  final ProductEntity product;

  const CartProductItem({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    return SlideInRight(
      duration: Duration(milliseconds: 200),
      child: Dismissible(
        key: Key(product.id.toString()),
        background: const SlideBackgroundCard(),
        direction: DismissDirection.startToEnd,
        resizeDuration: Duration(milliseconds: 400),
        movementDuration: Duration(milliseconds: 400),
        confirmDismiss: (direction) {

          ref.read(orderCartProvider.notifier).removeProduct(product: product);

          return Future.value(true);


        },
        child: AnimatedSize(
          duration: Duration(milliseconds: 300),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
          ),
          height: product.quantity > 1 ? 74 : 50,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      AdaptiveImage(
                        aspectRatio: 1/1,
                        imageUrl: "https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/7f17c36b-38db-4d74-8ed4-d3983957a293/Derivates/ab88505f-8375-4990-82fa-864f6bda6ce1.jpg",
                        borderRadius: 15,
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.name,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      color: Colors.black.withValues(alpha: .8),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CurrencyText(
                                    price: product.pricePf,
                                    textStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 15
                                    ),
                                  ),
                                  QuantityButton(
                                    product: product,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                if(product.quantity > 1)...{
                  Column(
                    children: [
                    Gap(8)
        ,               Row(
                      children: [
                        Text(
                          "Subtotal: ",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: Colors.black.withValues(alpha: .7),
                            fontSize: 11,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                        CurrencyText(
                          price: product.subTotal,
                          textStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 11
                          ),
                        ),
                      ],
                    )
                    ],
                  )
                }
              ],
            ),
          ),
        ),
      ),
    );

  }

}