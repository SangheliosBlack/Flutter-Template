import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class SlideBackgroundCard extends StatelessWidget {
  const SlideBackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.delete,
       
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(
              BootstrapIcons.trash,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
