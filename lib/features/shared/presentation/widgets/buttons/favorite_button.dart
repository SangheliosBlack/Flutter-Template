import 'dart:ui';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {

  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(
        10
      ),
      child: AnimatedContainer(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        ),
        duration: Duration(milliseconds: 300),
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Icon(
        BootstrapIcons.chat_heart_fill,
        color: Colors.white,
      ),
        ),
      ),
    );

      
  }

}