import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GoogleSignInButton extends StatelessWidget {

  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .05),
            blurRadius: 10,
            offset: Offset(0, 0),
            spreadRadius: 5
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          SvgPicture.asset(
            'assets/svg/google.svg',
          ),
        ],
      ),
    );

  }

}