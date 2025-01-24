import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/domain/domain.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/admin_aside.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';

class AdminAsideOption extends StatefulWidget {

  final MenuOptionEntity menuOption;

  const AdminAsideOption({super.key, required this.menuOption});

  @override
  State<AdminAsideOption> createState() => _AdminAsideOptionState();

}

class _AdminAsideOptionState extends State<AdminAsideOption> with TickerProviderStateMixin {

  bool _isPLay = false;
  late AnimationController animationController;
  bool selected = false;

  @override
  void initState() {

    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300), 
      vsync: this
    );

  }

  @override
  void dispose() {

    super.dispose();
    animationController.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        GestureDetector(
          onTap: widget.menuOption.titulo == "Cerrar sesion" ?(){
           
          } :  widget.menuOption.subMenu.isEmpty
              ? () {

                //Pendiente

                }
              : () {
                  if (!_isPLay) {
                    animationController.forward();
                    _isPLay = true;
                  } else {
                    animationController.reverse();
                    _isPLay = false;
                  }
                  setState(() {});
                },
          behavior: HitTestBehavior.translucent,
          child: HoverAnimatedContainer(
            decoration: const BoxDecoration(
              color: Colors.transparent
            ),
            cursor: SystemMouseCursors.click,
            hoverDecoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: .1),
              borderRadius: BorderRadius.circular(20)
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 13,
                  children: [
                    Icon(
                      widget.menuOption.icono,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      widget.menuOption.titulo,
                      style: GoogleFonts.quicksand(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    NotificacionMenuOption(
                      offstage: true,
                    ),
                    Offstage(
                      offstage: widget.menuOption.subMenu.isEmpty,
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        color: Colors.grey,
                        progress: animationController
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        AnimatedSize(
          reverseDuration: const Duration(milliseconds: 300),
          duration: const Duration(milliseconds: 300),
          child: _isPLay
            ? ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 0
              ),
              shrinkWrap: true,
              itemBuilder: (_, int i) => AdminAsideSubOption(
                last: i == widget.menuOption.subMenu.length - 1,
                subTitle: widget.menuOption.subMenu[i],
              ),
              separatorBuilder: (_, __) => Gap(0),
              itemCount: widget.menuOption.subMenu.length,
            )
            : Offstage(),
        )
      ],
    );
  }
}
