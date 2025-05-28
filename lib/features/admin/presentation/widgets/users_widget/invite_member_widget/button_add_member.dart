import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class ButtonInviteMember extends StatelessWidget {

  const ButtonInviteMember({super.key});

  @override
  Widget build(BuildContext context) {

    return  Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle
      ),
      child: Icon(
        BootstrapIcons.plus,
        color: Colors.white,
        size: 20,
      ),
    );

  }

}
