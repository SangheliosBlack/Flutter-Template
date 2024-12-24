import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterText extends StatefulWidget {
  final String texto;
  final Color color;
  const FooterText({super.key, required this.texto, this.color = Colors.grey});

  @override
  State<FooterText> createState() => _FooterTextState();
}

class _FooterTextState extends State<FooterText> {
  
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (e) {
        setState(() {
          hover = true;
        });
      },
      onExit: (e) {
        setState(() {
          hover = false;
        });
      },
      child: GestureDetector(
        onTap: () {
        },
        behavior: HitTestBehavior.translucent,
        child: Text(
          widget.texto,
          style: GoogleFonts.quicksand(
              color: hover ? Colors.black : widget.color, fontSize: 15),
        ).animate(autoPlay: true),
      )
    );
  }
}
