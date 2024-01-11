import 'package:flutter/material.dart';
import 'package:flutter_template/helpers/extensions.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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
            "DASHBOARD PRINCIPAL",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
