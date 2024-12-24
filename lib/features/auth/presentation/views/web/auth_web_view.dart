import 'package:flutter/material.dart';
import 'package:flutter_template/features/auth/presentation/widgets/web/footer_bar.dart';

import 'package:google_fonts/google_fonts.dart';

import 'web.dart';

class AuthWebView extends StatelessWidget {

  const AuthWebView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Banner(
        message: 'PRE-PROD',
        textStyle: GoogleFonts.quicksand(color: Colors.white, fontSize: 9),
        location: BannerLocation.topEnd,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Text(
                "Hola",
                style: GoogleFonts.quicksand(
                    height: 1, color: Colors.black, fontSize: 80),
              ),
              Text(
                "Un gusto verte de nuevo",
                style: GoogleFonts.quicksand(
                    color: Colors.grey, fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),*/
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    PresentationScreen(),
                    LoginScreen(
                    ),
                    /*
                    RegisterPage(
                      pageController: pageController,
                    )
                    */
                  ],
                ),
              ),
              Footer()
            ],
          ),
        ),
      );
  }
}
