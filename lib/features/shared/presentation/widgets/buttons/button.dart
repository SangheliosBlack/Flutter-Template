import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class Button extends StatelessWidget {

  final double borderRadius;
  final Widget child;
  final Function() onTap;
  final Color buttonColor;

  const Button({
    super.key,
    this.borderRadius = 20,
    this.buttonColor = AppTheme.primary,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          minWidth: double.infinity
        ),
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: Center(child: child),
      ),
    );

  }

}