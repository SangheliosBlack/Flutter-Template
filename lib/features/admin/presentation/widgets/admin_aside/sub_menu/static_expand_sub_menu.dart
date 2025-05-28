import 'package:flutter/material.dart';

class StaticExpandSubMenu extends StatelessWidget {

  const StaticExpandSubMenu({super.key});

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Container(
        width: .5,
        color: Colors.black,
      ),
    );

  }

}