import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter_template/helpers/extensions.dart';
import 'package:gap/gap.dart';

import '../widgets/widgets.dart';

class LoginMobileView extends ConsumerWidget {

  const LoginMobileView({super.key});

  @override
  Widget build(BuildContext context,ref) {

    //realmService.write(object:user);

    return Stack(
      children: [
      
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30
            ),
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                GoogleSignInButton(),
                OrLabel(),
                InputText(
                  labelText: 'Correo electronico', 
                  icon: BootstrapIcons.envelope_at
                ),
                Gap(20),
                InputText(
                  labelText: 'Contraseña', 
                  icon: BootstrapIcons.key
                ),
                RememberMe(),
                ConfirmButton(),
                RegisterAccountButton()
              ]
            ),
          ),
        )
      ],
    );
  }
  
}