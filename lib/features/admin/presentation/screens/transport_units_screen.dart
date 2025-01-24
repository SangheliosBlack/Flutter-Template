import 'package:flutter/material.dart';

class TransportUnitsScreen extends StatelessWidget {

  static const String path = "/admin/transportUnits";

  const TransportUnitsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Center(
        child: Text("Admin unidades screen"),
      ),
    );

  }

}