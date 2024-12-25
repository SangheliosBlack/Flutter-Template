import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/features/auth/application/providers/auth_controller.dart';
import 'package:flutter_template/features/splash/presentation/views/views.dart';
import 'package:go_router/go_router.dart';

import '../../../features_screens.dart';

class SplashScreen extends ConsumerWidget {

  static const String path = "/";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    ref.listen(authControllerProvider,(previous,next) async{

      if(next.authenticationStatus == AuthenticationStatus.authenticated){

        context.go(PointOfSaleScreen.path);
        //context.go(HiScreen.path);

      }

      if(previous!.authenticationStatus == AuthenticationStatus.checking && next.authenticationStatus == AuthenticationStatus.notAuthenticated){

        context.go(PresentationScreen.path);
      
      }

    });

    return Loader(
      isLoading: false,
      view: Scaffold(
        body: ResponsiveLayout(
          watchView: SplashMobileView(), 
          mobileView: SplashMobileView(), 
          tabletView: SplashMobileView(), 
          desktopView: SplashMobileView()
        )
      ), 
    );

  }
}