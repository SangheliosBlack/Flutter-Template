import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResponsiveLayout extends ConsumerStatefulWidget {
  
  final Widget watchView;
  final Widget mobileView;
  final Widget tabletView;
  final Widget desktopView;

  const ResponsiveLayout({
    super.key,
    required this.watchView,
    required this.mobileView,
    required this.tabletView,
    required this.desktopView,
  });

  @override
  ResponsiveLayoutState createState() => ResponsiveLayoutState();

}

class ResponsiveLayoutState extends ConsumerState<ResponsiveLayout> {

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
    
                if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
                  return widget.desktopView;
                }
    
                if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                  return widget.tabletView;
                }
    
                if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
                  return widget.watchView;
                }
                
                return widget.mobileView;
    
              },
            ),
        ),
      ],
    );
  }
}
