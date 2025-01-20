import 'package:flutter/widgets.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class Button extends StatelessWidget {

  final double borderRadius;
  final Widget child;
  final Function() onTap;
  final Color buttonColor;
  final bool locked;

  const Button({
    super.key,
    this.borderRadius = 20,
    this.buttonColor = AppTheme.primary,
    this.locked = false,
    required this.child,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedOpacity(
      opacity: locked && locked ? .5 : 1,
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
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
      ),
    );

  }

}