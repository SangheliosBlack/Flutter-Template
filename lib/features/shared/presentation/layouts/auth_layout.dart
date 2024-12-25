import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/presentation/widgets/widgets.dart';

class AuthLayout extends StatelessWidget {

  final Widget child;

  const AuthLayout({
    super.key, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(child: child),
              Footer()
            ],
          ),
        ),
      ),
    );

  }
}