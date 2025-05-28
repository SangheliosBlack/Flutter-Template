import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/presentation/widgets/users_widget/user_widget/widget.dart';

class AdminUserWidget extends StatefulWidget {


  const AdminUserWidget({
    super.key,
  });

  @override
  AdminUserWidgetState createState() => AdminUserWidgetState();

}

class AdminUserWidgetState extends State<AdminUserWidget> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      cursor: SystemMouseCursors.click, 
      onEnter: (e) {

        setState(() {
          hover = true;
        });

      },
      onExit: (e) {

        setState(() {
          hover = false;
        });

      },
      child: AnimatedScale(
        scale: hover ? 1.05 : 1,
        duration: Duration(milliseconds: 300),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(
              hover ? 255 : 0
            ),
            borderRadius: BorderRadius.circular(100)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  spacing: 5,
                  children: [
                    AdminUserImageWidget(),
                    UserLabels()
                  ],
                ),
              ),
              ComunicationWidget(hover: hover)
            ],
          ),
        ),
      ),
    );

  }
}