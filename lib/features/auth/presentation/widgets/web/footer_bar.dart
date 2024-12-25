import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/auth/presentation/widgets/web/footer_text.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {

  final bool darkness;

  const Footer({
    super.key,
    this.darkness = false
  });




  @override
  Widget build(BuildContext context) {

    return Container(
      color: darkness ? Colors.black : Colors.white,
      padding: const EdgeInsets.all(25),
      width: context.width,
      child: kIsWeb
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: 30,
                children: [
                  Text(
                    "Flutter template® 2024",
                    style: GoogleFonts.quicksand(
                        color: AppTheme.primary, fontSize: 15),
                  ),
                  const FooterText(texto: "Terminos y condiciones"),
                  const FooterText(texto: "Eliminar mi cuenta"),
                ],
              ),
              Row(
                children: [
                  Text(
                    "BetaPortalX ",
                    style: GoogleFonts.quicksand(
                        color: AppTheme.primary, fontSize: 15),
                  ),
                  Text(
                    "v1.0-beta",
                    style: GoogleFonts.quicksand(
                        color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ],
            )
          : Container(
              width: context.width,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        "BetaPortalX ",
                        style: GoogleFonts.quicksand(
                            color: AppTheme.primary, fontSize: 15),
                      ),
                      Text(
                        "v1.0-beta",
                        style: GoogleFonts.quicksand(
                            color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ],
              ),
            )
          );

  }

}