import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class AsideButton extends StatelessWidget {

  final IconData icon;
  final bool active;

  const AsideButton({
    super.key, 
    required this.icon,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){

      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12
        ),
        decoration: BoxDecoration(
          color: active ? AppTheme.secondary : Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          icon,
          color: active ? AppTheme.primary : Colors.black.withValues(alpha: .6),
          size: 17,
        ),
        
      )
    );
  }

}