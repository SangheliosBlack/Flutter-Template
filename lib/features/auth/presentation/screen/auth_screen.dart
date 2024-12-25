import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/presentation/layouts/layouts.dart';
import '../../../shared/presentation/widgets/widgets.dart';
import '../views/views.dart';

class LoginScreen extends ConsumerWidget {

  static const String path = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Loader(
      isLoading: false,
      view: SafeArea(
        bottom: false,
        top: false,
        child: Scaffold(
          body: ResponsiveLayout(
            watchView: AuthMobileView(), 
            mobileView: AuthWebView(), 
            tabletView: AuthMobileView(), 
            desktopView: AuthWebView()
          )
        ),
      ), 
    );

  }
}