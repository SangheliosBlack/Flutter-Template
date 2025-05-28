import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/users_widget/header_widget/widgets.dart';

class UserWidgetsHeader extends StatelessWidget {

  const UserWidgetsHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        CurrentUsers()
      ],
    );

  }

}