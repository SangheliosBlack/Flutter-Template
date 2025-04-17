import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientsHeader extends ConsumerWidget {

  const ClientsHeader({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
                'Todos mis',
                style: GoogleFonts.poppins(
                color: AppTheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.w300),
              ),
              Text(
                'Clientes',
                style: GoogleFonts.poppins(
                  color: Colors.black.withValues(alpha: .7),
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
           ],
         ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () { 

              ref.read(orderCartProvider.notifier).removeClient();

              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 1,
                  color: Colors.grey.withAlpha(100)
                )
              ),
              padding: EdgeInsets.all(5),
              child: Icon(
                BootstrapIcons.x,
                color: Colors.black.withAlpha(150),
                size: 30,
              )
            ),
          )
        ],
      ),
    );

  }

}