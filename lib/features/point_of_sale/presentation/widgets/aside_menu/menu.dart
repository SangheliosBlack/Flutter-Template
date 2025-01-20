import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/current_route.dart';
import 'package:flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter_template/features/features_screens.dart';
import 'package:flutter_template/features/point_of_sale/presentation/widgets/widgets.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AsideMenu extends ConsumerWidget {

  const AsideMenu({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final route = ref.watch(currentRouteProvider);

    return Container(
      margin: EdgeInsets.only(
        left: 25,
        top: 45,
        bottom: 20
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40)
      ),
      padding: EdgeInsets.only(
        top: 25,
        bottom: 10,
        left: 10,
        right: 10
      ),
      child: Column(
        children: [
          Gap(20),
          FlutterLogo(
            size: 40, 
            style: FlutterLogoStyle.markOnly, 
            textColor: Colors.blue,
          ),
          Gap(40),
          AsideButton(
            active: route == PoHomeScreen.path,
            icon: BootstrapIcons.house,
            onTap: (){

              context.push(PoHomeScreen.path);

            },
          ),
          Gap(15),
          AsideButton(
            active: route == SalesScreen.path,
            icon: BootstrapIcons.graph_up,
            onTap: (){

              context.push(SalesScreen.path);

            },
          ),
          Spacer(),
          AsideButton(
            active: false,
            icon: BootstrapIcons.box_arrow_right,
            onTap: (){
              ref.read(authProvider.notifier).logout();
            },
          ),
        ],
      ),
    );

  }

}