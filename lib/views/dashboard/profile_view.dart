import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PROFILE VIEW",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.black),
            ),
          ],
        ));
  }
}
