import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/admin_aside.dart';

class AdminLayout extends StatelessWidget {

  final Widget child;

  const AdminLayout({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(2, 2, 2, 1),
      body: Row(
        children: [
          AdminAsideMenu(),
        ],
      ),
    );
  
  }

}