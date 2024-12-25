
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';

class DashboardMobileView extends StatefulWidget {

  const DashboardMobileView({super.key});

  @override
  State<DashboardMobileView> createState() => _DashboardMobileViewState();

}

class _DashboardMobileViewState extends State<DashboardMobileView> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // App is in background
    } else if (state == AppLifecycleState.resumed) {
      // App is in foreground
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.primaryBody,
      child: Row(
        children: [
          AsideMenu(),
          BodyWidget(),
          AccountMenu()
        ],
      ),
    );
  }
}