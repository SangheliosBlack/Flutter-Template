import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DecreaseButton extends StatelessWidget {

  const DecreaseButton({super.key});

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
          color: Colors.grey.withValues(alpha: .2)
        ),
        child: Center(
          child: Icon(
            FontAwesomeIcons.minus,
            size: 10,
            color: Colors.black,
          )
        )
      ),
    );

  }

}