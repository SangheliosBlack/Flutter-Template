import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';

class RowCellCreation extends StatefulWidget {

  final List<Widget> widgets;

  const RowCellCreation({
    super.key,
    required this.widgets
  });

  @override
  State<RowCellCreation> createState() => _RowCellCreationState();

}

class _RowCellCreationState extends State<RowCellCreation> {

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
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primary.withValues(
            alpha: hover ? .2 : 0 
          )
        ),
        child: Row(
          children: widget.widgets,
        ),
      ),
    );

  }
}