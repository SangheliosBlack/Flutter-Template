import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/product_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/product_quantity_provider.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/widgets.dart';

class ProductCard extends ConsumerWidget {

  final ProductEntity product;

  const ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context,ref) {

    final int quantityProductCart = ref.watch(productQuantityProvider(product.id));

    return GestureDetector(
      onTap: (){

        ref.read(orderCartProvider.notifier).updateProductQuantity(product: product, quantity: product.quantity++);

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: AdaptiveImage(
                        borderRadius: 10,
                        imageUrl: "https://images.mrcook.app/recipe-image/01913f05-baf1-7c44-87e5-8c6525a24caa?cacheKey=U3VuLCAxMSBBdWcgMjAyNCAwMToyMDozMCBHTVQ%3D",
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                        padding: EdgeInsets.all(10),
                      child: Shade(
                        borderRadius: 10
                      ),
                    )
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      opacity: quantityProductCart > 0 ?  1: 0,
                      duration: Duration(
                        milliseconds: 100
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: .1 ),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 5)
                            )
                          ]
                        ),
                        child: Icon(
                          BootstrapIcons.basket,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    )                )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10, 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                      color: Colors.black.withValues(alpha: .8),
                      fontSize: 12,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CurrencyText(
                            price: product.pricePf,
                            textStyle: GoogleFonts.poppins(
                              color: Colors.black.withValues(alpha: .8),
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),
                            
                          ),
                        ],
                      ),
                      QuantityButtonListProduct(product: product,)
                    ],
                  ),
                  Gap(10)
                ],
              ),
            )
          ],
        ),
      ),
    );

  }

}


