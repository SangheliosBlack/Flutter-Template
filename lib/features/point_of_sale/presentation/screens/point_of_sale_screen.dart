import 'package:flutter/material.dart';
import 'package:flutter_template/features/shared/presentation/presentation.dart';

import '../views/views.dart';

class PointOfSaleScreen extends StatelessWidget {

  static const String path = "/point-of-sale";

  const PointOfSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Loader(
      isLoading: false,
      view: SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          body: ResponsiveLayout(
            watchView: DashboardMobileView(), 
            mobileView: DashboardMobileView(), 
            tabletView: DashboardMobileView(), 
            desktopView: DashboardMobileView()
          )
        ),
      ), 
    );

  }
}