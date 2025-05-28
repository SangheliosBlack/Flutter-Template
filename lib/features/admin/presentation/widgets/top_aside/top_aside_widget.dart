import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/widgets.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';

class TopAsideWidget extends StatelessWidget {

  const TopAsideWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
    
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
        
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserDataCard(),
          Visibility(
            visible: false,
            child: Row(
              spacing:10,
              children: [
                SearchWidget(),
                SnButton(
                  labelActive: true,
                  icon: BootstrapIcons.bell,
                  onTap: () {
                    
                  },
                ),
                SnButton(
                  icon: BootstrapIcons.chat_dots,
                  onTap: () {
                    
                  },
                )
              ],
            ),
          )
        ],
      ),
    );

  }

}