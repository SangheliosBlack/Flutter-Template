import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/core/constants/ui_constants_values.dart';
import 'package:flutter_template/features/shared/presentation/widgets/data_table/paginator/button_paginator.dart';

class IndicatorDots extends StatelessWidget {

  final bool reverse;
  final int index;
  final double opacity;
  final void Function()? onTap;

  const IndicatorDots({
    super.key,
    this.reverse = false,
    required this.index,
    required this.opacity,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
       onTap: onTap,

       behavior: HitTestBehavior.translucent,
       child: AnimatedOpacity(
       duration: Duration(
         milliseconds: 200
       ),
       opacity: opacity,
       child: AnimatedContainer(
          duration: UiConstantsValues.defaultAnimationDuration,
          width: 47,
          child: Row(
           textDirection: reverse ? TextDirection.rtl : TextDirection.ltr,
           children: [
             Icon( 
               reverse ? BootstrapIcons.chevron_double_left  : BootstrapIcons.chevron_double_right,
               color: AppTheme.primary,
               size: 15
             ),
              ButtonPaginator(
               active: false,
               index: index,
               limit: true,
             ),
           ],
         ),
       ),
     ),
    );
  }

}