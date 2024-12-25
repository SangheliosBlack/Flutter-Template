import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileCard extends StatelessWidget {

  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 230,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              spacing: 10,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle
                    
                  ),
                  child: Image(
                    image: AssetImage(
                      "assets/images/example.png",
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Julio Villagrana",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          color: Colors.black.withValues(alpha: .8),
                          fontSize: 12,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                        Text(
                        "Caja 1",
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 11,
                          fontWeight: FontWeight.w300
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(BootstrapIcons.gear)
        ],
      ),
    );

  }

}