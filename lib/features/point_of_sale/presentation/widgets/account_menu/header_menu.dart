import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderAccountMenu extends StatelessWidget {

  const HeaderAccountMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15
      ),
      child: Row(
        children: [
          Text("Cuenta",
            style: GoogleFonts.poppins(
              color: Colors.black.withValues(alpha: .8),
              fontSize: 15,
              fontWeight: FontWeight.w600
            ),
          ),
          Spacer(),
          Row(
            spacing: 20,
            children: [
              Row(
                spacing: 10,
                children: [
                   Container(
                    width: 7,
                    height: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green
                    ),
                  ),
                  Icon(
                    BootstrapIcons.printer,
                    color: Colors.black,
                    size: 20,
                  ),
                 
                ],
              ),
              Icon(
                BootstrapIcons.three_dots,
                color: Colors.black,
                size: 20,
              ),
            ],
          )
        ],
      ),
    );
  }

}