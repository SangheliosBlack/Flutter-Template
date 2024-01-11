import 'package:auto_route/auto_route.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hidable/hidable.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:flutter_template/themes/main_theme.dart';
import 'package:flutter_template/views/dashboard/another_view.dart';
import 'package:flutter_template/views/dashboard/dashboard_view.dart';
import 'package:flutter_template/views/dashboard/profile_view.dart';

@RoutePage()
class DashBoardDefaultPage extends StatefulWidget {
  const DashBoardDefaultPage({super.key});

  @override
  State<DashBoardDefaultPage> createState() => _DashBoardDefaultViewState();
}

class _DashBoardDefaultViewState extends State<DashBoardDefaultPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = [
    const DashboardView(),
    const ProfileView(),
    const AnotherView()
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        resizeToAvoidBottomInset: true,
        extendBody: true,
        bottomNavigationBar: Hidable(
          enableOpacityAnimation: true,
          controller: _scrollController,
          child: CurvedNavigationBar(
            height: 70,
            buttonBackgroundColor: Themes.primary,
            backgroundColor: Colors.transparent,
            color: Themes.primary,
            items: const [
              Padding(
                  padding:
                      EdgeInsets.only(right: 8, left: 5, top: 5, bottom: 5),
                  child: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.white,
                    size: 20,
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
                  child: Icon(
                    FontAwesomeIcons.solidUser,
                    color: Colors.white,
                    size: 20,
                  )),
              Padding(
                padding: EdgeInsets.only(right: 8, left: 5, top: 5, bottom: 5),
                child: Icon(
                  FontAwesomeIcons.doorClosed,
                  color: Colors.white,
                  size: 20,
                ),
              )
            ],
            index: _selectedIndex,
            onTap: (index) => setState(() {
              _selectedIndex = index;
            }),
          ),
        ),
        body: LiquidPullToRefresh(
          springAnimationDurationInMilliseconds: 300,
          borderWidth: 1,
          height: 150,
          showChildOpacityTransition: false,
          backgroundColor: Colors.white,
          color: Colors.lightBlue,
          onRefresh: () async {},
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: _widgetOptions.elementAt(_selectedIndex)),
        ));
  }
}
