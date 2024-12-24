import 'package:flutter/material.dart';

class Shade extends StatelessWidget {

  final double borderRadius;

  const Shade({
    super.key,
    required this.borderRadius
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withValues(alpha: .6),
            Colors.black.withValues(alpha: 0),
          ]
        )
      ),
      duration: Duration(
        milliseconds: 300
      ),
    );

  }

}