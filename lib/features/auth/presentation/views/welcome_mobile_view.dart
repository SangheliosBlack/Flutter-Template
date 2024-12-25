import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';

import '../widgets/widgets.dart';

class WelcomeMobileView extends StatelessWidget {

  const WelcomeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.height,
          width: context.width,
          child: Image(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        BackgroundStack(),
      ]
    );
  }

}