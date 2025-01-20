import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/domain/domain.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryMethodButton extends StatelessWidget {

  final DeliveryTypeEntity data;
  final bool active;

  const DeliveryMethodButton({
    super.key,
    required this.active,
    required this.data
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){},
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        width: ((290 - 70) / 3),
        duration: Duration(
          milliseconds: 300
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: active ?  AppTheme.secondary : Colors.white,
          border: Border.all(
            width: 2,
            color: active ?  AppTheme.primary : Colors.transparent
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data.icon,
              size: 16,
              color: active ?  AppTheme.primary : Colors.grey
            ),
            Gap(5),
            Text(
              data.label,
              style: GoogleFonts.poppins(
                color: active ?  AppTheme.primary : Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.w300
              )
            )
          ],
        ),
      ),
    
      
    );

  }

}