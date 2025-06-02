import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/current_route.dart';
import 'package:flutter_template/features/admin/domain/domain.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/admin_aside.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/sub_menu/admin_sub_option.dart';
import 'package:flutter_template/features/auth/application/use_cases/providers/auth_provider.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAsideOption extends ConsumerStatefulWidget {

  
  final MenuOptionEntity menuOption;

  const AdminAsideOption({super.key, required this.menuOption});

  @override
  ConsumerState<AdminAsideOption> createState() => _AdminAsideOptionState();
}

class _AdminAsideOptionState extends ConsumerState<AdminAsideOption> with TickerProviderStateMixin {
  bool _isPLay = true;
  late AnimationController animationController;
  bool selected = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    final route = ref.watch(currentRouteProvider);

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
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.menuOption.titulo == "Cerrar sesion"
                ? () {
                    ref.read(authProvider.notifier).logout();
                  }
                : widget.menuOption.subMenuOptions.isEmpty
                    ? () {
                        
//                      context.push(widget.menuOption);

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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              decoration: BoxDecoration(
                color: Color(0xffDD052B).withAlpha(hover ? 255 : 0),
                borderRadius: BorderRadius.circular(hover ? 20 : 0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        widget.menuOption.icono,
                        color: hover ? Colors.white : Colors.black,
                        size: 15,
                      ),
                      SizedBox(width: 13),
                      Text(
                        widget.menuOption.titulo,
                        style: GoogleFonts.quicksand(
                          color: hover ? Colors.white : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      NotificacionMenuOption(
                        offstage: true,
                      ),
                      Visibility(
                        visible: widget.menuOption.subMenuOptions.isNotEmpty,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: hover ? Colors.black : Color.fromRGBO(236, 230, 226, 1),
                            shape: BoxShape.circle,
                          ),
                          child: AnimatedIcon(
                            icon: AnimatedIcons.menu_close,
                            color: hover ? Colors.white : Colors.black.withAlpha(200),
                            size: 14,
                            progress: animationController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            reverseDuration: const Duration(milliseconds: 300),
            duration: const Duration(milliseconds: 300),
            child: _isPLay
                ? ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                    shrinkWrap: true,
                    itemBuilder: (_, i) => AdminAsideSubOption(
                      last: i == widget.menuOption.subMenuOptions.length - 1,
                      adminSubMenuOption: widget.menuOption.subMenuOptions[i], 
                      active: route == widget.menuOption.subMenuOptions[i].path,
                    ),
                    separatorBuilder: (_, __) => Gap(0),
                    itemCount: widget.menuOption.subMenuOptions.length,
                  )
                : Offstage(),
          ),
        ],
      ),
    );
  }
}
