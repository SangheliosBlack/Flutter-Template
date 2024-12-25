import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/presentation/widgets/widgets.dart';

class ProductCard extends StatelessWidget {

  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: AdaptiveImage(
                    borderRadius: 10,
                    imageUrl: "https://images.mrcook.app/recipe-image/01913f05-baf1-7c44-87e5-8c6525a24caa?cacheKey=U3VuLCAxMSBBdWcgMjAyNCAwMToyMDozMCBHTVQ%3D",
                  ),
                ),
                Positioned.fill(
                  child: Shade(
                    borderRadius: 10
                  )
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: FavoriteButton()
                ),

              ],
            ),
          ),
          Text(
            "Nombre",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          ),
          Row(
            children: [
              CurrencyText(
                price: 100,
                
              ),
              Text(
                " /Porcion",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          )
        ],
      ),
    );

  }

}


