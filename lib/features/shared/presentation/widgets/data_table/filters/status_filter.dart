import 'package:flutter/material.dart';
import 'package:flutter_template/features/shared/presentation/widgets/buttons/status_button_filter.dart';
import 'package:gap/gap.dart';

class StatusFilter extends StatelessWidget {

  const StatusFilter({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        top: 10
      ),
      decoration: BoxDecoration(
         border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: .1)
          )
         )
      ),
      height: 47,
      width: double.infinity,

      child: ListView.separated(
        itemBuilder: (_,index) {

          return StatusButtonFilter();

        }, 
        padding: EdgeInsets.symmetric(
          horizontal: 15
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_,__) => Gap(10), 
        itemCount: 3
      ),
    );

  }

}