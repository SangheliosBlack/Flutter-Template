import 'package:flutter/material.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';

import '../../../../../core/config/themes/main_theme.dart';

class BodyWidget extends StatelessWidget {
  
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 10,
          top: 25
        ),
        child: Column(
          spacing: 10,
          children: [
            HeaderSearchBar(),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
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
                  Container(
                    height: 5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                       
                        colors: [
                          AppTheme.primaryBody.withValues(alpha: 0),
                          AppTheme.primaryBody.withValues(alpha: 0),
                        ]
                      )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}