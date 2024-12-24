import 'package:flutter/material.dart';

class AdaptativeGesture extends StatelessWidget {

  final Widget child;

  const AdaptativeGesture({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
       cursor: SystemMouseCursors.click,
       child: child    
    );

  }
}