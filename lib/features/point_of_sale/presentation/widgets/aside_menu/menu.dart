import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/auth/application/providers/auth_controller.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';

class AsideMenu extends ConsumerWidget {

  const AsideMenu({super.key});

  @override
  Widget build(BuildContext context,ref) {

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 15
      ),
      child: Column(
        children: [
          FlutterLogo(
            size: 40, 
            style: FlutterLogoStyle.markOnly, 
            textColor: Colors.blue,
          ),
          Gap(40),
          AsideButton(
            active: true,
            icon: BootstrapIcons.house
          ),
          Spacer(),
          AsideButton(
            active: false,
            icon: BootstrapIcons.box_arrow_right,
            onTap: (){
              ref.read(authControllerProvider.notifier).logout();
            },
          ),
        ],
      ),
    );

  }

}