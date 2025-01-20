import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:flutter_template/helpers/extensions.dart';

class PointOfSaleLayout extends StatelessWidget {

  final Widget child;

  const PointOfSaleLayout({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      width: context.width,
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: Row(
        children: [
          AsideMenu(),
          Expanded(child: child),
          AccountMenu()
        ],
            ),
      ),
    );
  }

}