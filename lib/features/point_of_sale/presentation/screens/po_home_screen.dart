import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';

class PoHomeScreen extends StatelessWidget {

  static const String path = "/point-of-sale";

  const PoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      key: ValueKey("poScreen"),
      color: AppTheme.backgroundColor,
      padding: EdgeInsets.only(top: 20),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25
        ),
        child: Column(
          spacing: 10,
          children: [
            HeaderSearchBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 25
                ),
                child: Column(
                  children: [
                    CategoriesWidget(),
                    ProductsWidget()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}