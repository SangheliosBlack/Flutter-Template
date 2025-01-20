import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';

class NextButton extends ConsumerWidget {

  final bool active; 

  const NextButton({
    super.key,
    required this.active
  });

  @override
  Widget build(BuildContext context,ref) {

    final currentPage = ref.watch(coolDataTableProvider.select((state) => state.currentPage));

    return AnimatedOpacity(
      opacity: active ? 1: .2,
      duration: Duration(
        milliseconds: 200
      ),
      child: GestureDetector(
        onTap: (){

          if(!active) return;

          ref.read(coolDataTableProvider.notifier).updateCurrentPage(newCurrentPage:  currentPage  + 1);

        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: 15,
          height: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              BootstrapIcons.chevron_right,
              color: Colors.black,
              size: 15,
            ),
          ),
        ),
      ),
    );

  }

}