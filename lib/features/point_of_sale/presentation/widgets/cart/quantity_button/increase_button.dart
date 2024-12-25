import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IncreaseButton extends StatelessWidget {

  const IncreaseButton({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){},
      child: AnimatedContainer(
        width: 20,
        height: 20,
        duration: Duration(
          milliseconds: 300
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppTheme.primary
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.plus,
            size: 10,
            color: Colors.white,
          )
        ),
      ),
    );

  }

}