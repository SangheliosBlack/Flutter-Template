import 'package:flutter/material.dart';
import 'package:flutter_template/features/shared/presentation/widgets/chips/simple_chip.dart';
import 'package:gap/gap.dart';

class ListFilter extends StatelessWidget {

  const ListFilter({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 7
      ),
      decoration: BoxDecoration(
         border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: .1)
          )
         )
      ),
      height: 40,
      width: double.infinity,

      child: ListView.separated(
        itemBuilder: (_,index) {

          return SimpleChip();

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