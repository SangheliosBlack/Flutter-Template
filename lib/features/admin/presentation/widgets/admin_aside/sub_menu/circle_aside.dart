import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class CircleAside extends StatelessWidget {

  final bool hover;

  const CircleAside({
    super.key,
    required this.hover
  });


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(2),
      width: 11,
      height: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent,
        border: Border.all(
          width: 1,
          color: Colors.white,
        )
      ),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: hover
            ? AppTheme.primary
            : Colors.transparent,
        ),
        duration: const Duration(milliseconds: 200),
      ),
    );

  }

}