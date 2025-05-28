import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class NotificationPermission extends StatelessWidget {

  static const String path = "/notification-permission";

  const NotificationPermission({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      key: ValueKey("poScreen"),
      color: AppTheme.backgroundColor,
      padding: EdgeInsets.only(top: 20),
      child: Padding(
        padding: EdgeInsets.only(
          top: 25
        ),
        child: Column(
          spacing: 10,
          children: [
            Image(
              image: AssetImage("assets/images/notification_permission.avif")
            )
          ],
        ),
      ),
    );
  }
}