import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_template/helpers/extensions.dart';

class AnotherView extends StatelessWidget {
  const AnotherView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                authBloc.add(LogoutEvent());
                context.router.replaceNamed('/auth');
              },
              behavior: HitTestBehavior.translucent,
              child: Text(
                "CERRAR SESION",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black),
              ),
            ),
          ],
        ));
  }
}
