import 'package:flutter/material.dart';

class AdminHomeScreen extends StatelessWidget {

  static const String path = "/admin";

  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Center(
        child: Text("Admin Home Screen"),
      ),
    );

  }

}