import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/total_description/total_description_widget.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class AccountMenu extends StatelessWidget {

  const AccountMenu({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 15
      ),
      constraints: BoxConstraints(
        maxWidth: 290,
        minWidth: 290
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderAccountMenu(),
          CartProductList(),
          TotalDescription(),
          PaymentMethodCard(),
          Button(
            onTap: () {  },
            borderRadius: 10,
            child: Text(
              "Confirmar",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
        ],
      ),
    );

  }

}