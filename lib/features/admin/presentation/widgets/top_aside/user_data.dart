import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/admin/presentation/widgets/top_aside/top_aside_export.dart';
import 'package:flutter_template/features/admin/presentation/widgets/users_widget/user_widget/circle_image_user.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDataCard extends StatelessWidget {

  const UserDataCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      spacing: 8,
      children: [
        Badge(
          alignment: Alignment.topRight,
          backgroundColor: Colors.red,
          largeSize: 12,
          smallSize: 1,
          label: Container(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: AdminUserImageWidget()
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameFieldWidget(),
            RoleNameWidget()
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10
          ),
          width: .5,
          height: 40,
          color: Colors.grey.withAlpha(50),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 7,
            horizontal: 15
          ),
          decoration: BoxDecoration(
            color: AppTheme.backgroundColorSencondary,
            borderRadius: BorderRadius.circular(100)
          ),
          child: Row(
            spacing: 10,
            children: [
              Icon(
                BootstrapIcons.calendar_minus,
                color: Color.fromRGBO(35,34,64,1),
                size: 13,
              ),
              Text(
                "Q1",
                style: GoogleFonts.roboto(
                  color: Color.fromRGBO(35,34,64,1),
                  fontSize: 12,
                  fontWeight: FontWeight.w300
                ),
              )
            ],
          ),
        )

      ],
    );

  }

}