import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dart_phonetics/dart_phonetics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/auth/presentation/screen/login_web_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PresentationScreen extends ConsumerWidget {

  static String path = "/auth";

  const PresentationScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context,ref) {

    List<String> phrases = [
      'Un gusto verte de nuevo',
      'Nice to see you again',
      'Ravi de te revoir',
      'Schön, dich wiederzusehen',
      'Piacere di rivederti',
      'Bom te ver novamente',
      'Рад видеть тебя снова',
      '很高兴再次见到你',
      'また会えて嬉しいですね',
      'سررت برؤيتك مرة أخرى',
    ];

    final inputString = 'koca';

    final doubleMetaphone = DoubleMetaphone.withMaxLength(2);
    _printResult(doubleMetaphone, inputString);

    final inputString2 = 'coca';

    _printResult(doubleMetaphone, inputString2);

    return Container(
      key: ValueKey('welcomeScreen'),
      color: Colors.white ,
      width: context.width,
      child: Stack(
        children: [
          ResponsiveBuilder(
            builder:
                (BuildContext context, SizingInformation sizingInformation) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hola",
                      style: GoogleFonts.quicksand(
                          height: 1, color: Colors.black, fontSize: 80),
                    ),
                    SizedBox(
                      height: 40,
                      child: DefaultTextStyle(
                        style: GoogleFonts.quicksand(
                            color: Colors.grey, fontSize: 20),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: true,
                          repeatForever: true,
                          animatedTexts: phrases
                              .map((text) => RotateAnimatedText(text))
                              .toList(),
                          onTap: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: sizingInformation.isMobile ? 25 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Bienvenido a ',
                              style: GoogleFonts.quicksand(color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Flutter template',
                                  style: GoogleFonts.quicksand(
                                      color: AppTheme.primary),
                                ),
                                TextSpan(
                                  text: ', tu compañero para iniciar en Flutter.',
                                  style: GoogleFonts.quicksand(
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 0),
                          height: 45,
                          padding: EdgeInsets.symmetric(
                              horizontal: sizingInformation.isMobile ? 25 : 0),
                          width:
                              sizingInformation.isMobile ? context.width : 500,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: MouseRegion(
                                  
                                  cursor: SystemMouseCursors.click,
                                  child: GestureDetector(
                                    key: const ValueKey('loginButton'),
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {

                                      context.go(LoginScreen.path);

                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppTheme.primary),
                                      child: Center(
                                          child: Text(
                                        "Iniciar sesion",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.white, fontSize: 17),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        kIsWeb
                            ? Container()
                            : Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Registrarme",
                                        style: GoogleFonts.quicksand(
                                            color: Colors.grey, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ],
                    )
                  ]);
            },
          ),
          
          
        ],
      ),
    );
  }

  void _printResult(PhoneticEncoder encoder, String input) {
  final encoding = encoder.encode(input);
  // ignore: avoid_print
  print(
      '${encoder.runtimeType.toString()} - "$input"\n  primary = ${encoding?.primary}\n  alternate = ${encoding?.alternates}\n');
}

}
