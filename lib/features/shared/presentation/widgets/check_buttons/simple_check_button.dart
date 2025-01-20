import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class SimpleCheckButton extends StatelessWidget {

  const SimpleCheckButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(5)
      ),
    );
  }
  
}