import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/domain/entities/admin_sub_menu_option.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/sub_menu/circle_aside.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/sub_menu/expand_sub_menu.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/sub_menu/static_expand_sub_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAsideSubOption extends StatefulWidget {

  final AdminSubMenuOption adminSubMenuOption;
  final bool last;
  final bool active;

  const AdminAsideSubOption({
    super.key, 
    this.last = false,
    required this.adminSubMenuOption, 
    required this.active
  });

  @override
  State<AdminAsideSubOption> createState() => _AdminAsideSubOptionState();

}

class _AdminAsideSubOptionState extends State<AdminAsideSubOption> {

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

          if(widget.active) return;

          context.push(widget.adminSubMenuOption.path);
          
        },
        behavior: HitTestBehavior.translucent,
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
                  StaticExpandSubMenu(),
                  CircleAside(
                    hover: hover || widget.active,
                  ),
                  ExpandSubMenu(
                    isLast: widget.last,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                AnimatedSize(
                  
                  duration: Duration(
                    milliseconds: 300
                  ),
                  child: SizedBox(
                    width: hover ? 5 : 0,
                  ),
                ),
                Text(
                  widget.adminSubMenuOption.title,
                  style: GoogleFonts.quicksand(
                    color: Colors.black,
                    fontSize: 12
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
