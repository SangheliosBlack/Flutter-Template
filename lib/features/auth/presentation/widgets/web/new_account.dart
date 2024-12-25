import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NewAccount extends StatelessWidget {

  const NewAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return kIsWeb
      ? Container()
      : Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¿No tienes cuenta?',
                style: GoogleFonts.quicksand(color: Colors.black),
              ),
              const Gap(10),
              TextButton(
                onPressed: () {
                },
                child: Text(
                  'Registrate',
                  style: GoogleFonts.quicksand(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600
                  ),
                ))
            ]
          ),
      );
  }

}