import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class ComunicationWidget extends StatelessWidget {

  final bool hover;

  const ComunicationWidget({
    super.key,
    required this.hover
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      decoration: BoxDecoration(
        color: !hover ? Colors.white : Colors.black.withAlpha(200),
        shape: BoxShape.circle
      ),
      padding: EdgeInsets.all(10),
      duration: Duration(milliseconds: 300),
      child: Icon(
        BootstrapIcons.envelope_at_fill,
         color: hover ? Colors.white : Colors.black.withAlpha(200),
        size: 15,
      ),
    );

  }

}