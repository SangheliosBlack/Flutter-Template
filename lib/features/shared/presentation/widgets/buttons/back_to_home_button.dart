import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/constants/ui_constants.dart';
import 'package:flutter_template/features/auth/presentation/screen/auth_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BackToHomeButton extends StatelessWidget {

  const BackToHomeButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(
        top: 15
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10
      ),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: UiConstants.backToHomeButton1,
              style: GoogleFonts.poppins(color: Colors.white),
              children: <TextSpan>[
                TextSpan(
                  text: UiConstants.backToHomeButton1,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.go(LoginScreen.path);
                    },
                ),
              ],
            ),
          ),
          Icon(
            BootstrapIcons.arrow_right,
            color: Colors.white,
            size: 15,
          )
        ],
      ),
    );

  }

}