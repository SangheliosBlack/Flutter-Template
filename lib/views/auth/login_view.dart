import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:skeleton/themes/main_theme.dart';
import 'package:skeleton/widgets/auth/login_card_widget.dart';


class LoginView extends StatelessWidget {
  final PageController pageController;
  const LoginView({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LoginCard(),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              '¿No tienes cuenta?',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
                onPressed: () {
                      pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                child: Text(
                  'Registrate',
                  style: GoogleFonts.quicksand(
                      color: Themes.primary, fontWeight: FontWeight.w600),
                ))
          ]),
        ],
      ),
    );
  }
}
