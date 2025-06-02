import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/constants/constants_data.dart';
import 'package:flutter_template/features/admin/domain/domain.dart';
import 'package:flutter_template/features/admin/presentation/widgets/admin_aside/admin_aside_header.dart';
import 'package:gap/gap.dart';

import 'admin_aside.dart';

class AdminAsideMenu extends StatefulWidget {
  
  const AdminAsideMenu({super.key});

  @override
  State<AdminAsideMenu> createState() => _AdminAsideMenuState();

}

class _AdminAsideMenuState extends State<AdminAsideMenu> {

  @override
  Widget build(BuildContext context) {

    return AnimatedSize(
      reverseDuration: const Duration(milliseconds: 200),
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        width: 250,
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.secondary,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10, 
            horizontal: 5
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdminAsideHeader(),
              Gap(15),
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  padding: const EdgeInsets.all(5),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, i) => AdminAsideOption(
                      menuOption: ContantsData.adminListMenuOptions[i],
                    ),
                    separatorBuilder: (_, __) => const Gap(5),
                    itemCount: ContantsData.adminListMenuOptions.length,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  spacing: 5,
                  children: [
                    AdminAsideOption(
                      menuOption: MenuOptionEntity(
                        titulo: "Cerrar sesion",
                        icono: BootstrapIcons.box_arrow_left,
                        subMenuOptions: [],
                        
                      ),
                    ),
                    AdminAsideOption(
                      menuOption: MenuOptionEntity(
                        titulo: "Configuracion",
                        icono: BootstrapIcons.gear_wide_connected,
                        subMenuOptions: []
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
