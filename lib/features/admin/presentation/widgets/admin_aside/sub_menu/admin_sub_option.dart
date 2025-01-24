import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

class AdminAsideSubOption extends StatefulWidget {

  final String subTitle;
  final bool last;

  const AdminAsideSubOption({
    super.key, 
    this.last = false,
    required this.subTitle, 
  });

  @override
  State<AdminAsideSubOption> createState() => _AdminAsideSubOptionState();

}

class _AdminAsideSubOptionState extends State<AdminAsideSubOption> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
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
          //Pendiente
        },
        behavior: HitTestBehavior.translucent,
        child: HoverAnimatedContainer(
          cursor: SystemMouseCursors.click,
          hoverDecoration: BoxDecoration(
            color: Colors.black.withValues(alpha:.5),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 35),
                height: 32,
                child: Column(
                  children: [
                    ExpandSubMenu(
                      isLast: widget.last,
                    ),
                    CircleAside(
                      hover: hover,
                    ),
                    ExpandSubMenu(
                      isLast: widget.last,
                    ),
                  ],
                ),
              ),
              Text(
                widget.subTitle,
                style: GoogleFonts.quicksand(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
