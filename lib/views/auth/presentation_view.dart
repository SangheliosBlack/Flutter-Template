import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeleton/helpers/extensions.dart';
import 'package:skeleton/themes/main_theme.dart';

class Presentation extends StatelessWidget {
  final PageController pageController;
  const Presentation({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      width: context.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de ",
                  style: GoogleFonts.quicksand(color: Colors.grey),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(width: 1, color: Themes.primary)),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        pageController.animateToPage(1,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Themes.primary),
                        child: Center(
                            child: Text(
                          "Iniciar sesion",
                          style: GoogleFonts.quicksand(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        pageController.animateToPage(2,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Registrarme",
                              style: GoogleFonts.quicksand(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            const Icon(
                              Icons.login,
                              size: 15,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
    );
  }
}