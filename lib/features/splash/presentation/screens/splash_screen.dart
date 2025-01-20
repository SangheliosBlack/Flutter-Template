import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/services/auth_service/authentication_service_state.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/splash/presentation/views/views.dart';

import '../../../features_screens.dart';

class SplashScreen extends ConsumerWidget {

  static const String path = "/";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    ref.listen(authProvider,(previous,next) async{

      if(next.authenticationStatus == AuthenticationStatus.authenticated){

        //context.go(PoHomeScreen.path);
        //context.go(HiScreen.path);

      }

      if(previous!.authenticationStatus == AuthenticationStatus.checking && next.authenticationStatus == AuthenticationStatus.notAuthenticated){

        //context.go(PresentationScreen.path);
      
      }

    });

    return Loader(
      isLoading: false,
      view: Scaffold(
        key: const ValueKey('splashScreen'),
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