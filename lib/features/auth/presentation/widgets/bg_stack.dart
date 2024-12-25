import 'package:flutter/material.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0),
              Colors.black
            ],
            stops: [
              .1,
              .7
            ],
            begin: AlignmentDirectional.topCenter,
            end: AlignmentDirectional.bottomCenter
          )
        ),
      )
    );
  }
}