import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class SnButton extends StatelessWidget {

  final Function()? onTap;
  final IconData icon;
  final bool? labelActive;

  const SnButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.labelActive = false
  });

  @override
  Widget build(BuildContext context) {

    if(labelActive == false){

      return GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColorSencondary,
            shape: BoxShape.circle
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
             color: Colors.black.withAlpha(200),
            size: 16,
          ),
        )
      );

    }

    return Badge(
      smallSize: 11,
      backgroundColor: Colors.red,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.translucent,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColorSencondary,
            shape: BoxShape.circle
          ),
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            color: Colors.black.withAlpha(200),
            size: 16,
          ),
        )
      ),
    );

  }

}