import 'package:flutter/material.dart';
import 'package:flutter_template/core/constants/ui_constants_values.dart';
import 'package:flutter_template/features/admin/presentation/widgets/users_widget/invite_member_widget/button_add_member.dart';
import 'package:flutter_template/features/admin/presentation/widgets/users_widget/widget.dart';
import 'package:gap/gap.dart';

class AdminUsersWidget extends StatefulWidget {
  
  const AdminUsersWidget({super.key});

  @override
  AdminUsersWidgetState createState() => AdminUsersWidgetState();
}

class AdminUsersWidgetState extends State<AdminUsersWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 400,
      padding: EdgeInsets.only(
        top: 20,
        left: 10,
        right: 10,
        bottom: 5,
      ),
      decoration: UiConstantsValues.defaultDecoration,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrentUsersLabel(),
              Row(
                spacing:7,
                children: [
                  CurrentUsers(),
                  ButtonInviteMember()
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withAlpha(50),
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (_, i) {

                return AdminUserWidget();

              },
              separatorBuilder: (_, __) => Gap(10),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
