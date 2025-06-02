import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/admin_aside.dart';
import 'package:flutter_template/features/admin/presentation/widgets/top_aside/top_aside_widget.dart';

class AdminLayout extends StatelessWidget {

  final Widget child;

  const AdminLayout({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            AdminAsideMenu(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    TopAsideWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
  }

}