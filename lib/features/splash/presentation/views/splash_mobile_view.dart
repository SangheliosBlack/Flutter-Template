import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class SplashMobileView extends StatelessWidget {

  const SplashMobileView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Center(
        child: SvgPicture.asset(
          width: 80,
          height: 80,
          colorFilter: ColorFilter.mode(
            Colors.white, 
            BlendMode.srcIn
            ),
          'assets/svg/flutter.svg',
        ),
      ),
    );
  }
  
}
