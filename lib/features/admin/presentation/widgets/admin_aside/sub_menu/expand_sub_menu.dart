import 'package:flutter/material.dart';

class ExpandSubMenu extends StatelessWidget {

  final bool isLast;

  const ExpandSubMenu({
    super.key,
    required this.isLast
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        width: .5,
        color: Colors.black.withAlpha(isLast ? 0 : 255),
      ),
    );

  }

}