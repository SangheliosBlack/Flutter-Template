import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';

class PreviousButton extends ConsumerWidget {

  final bool active;

  const PreviousButton({
    super.key,
    required this.active
  });


  @override
  Widget build(BuildContext context, ref) {

    final currentPage = ref.watch(coolDataTableProvider.select((state) => state.currentPage));

    return AnimatedOpacity(
      duration: Duration(milliseconds: 200),
      opacity: active ? 1 : .2,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){

          if(!active) return;

          ref.read(coolDataTableProvider.notifier).updateCurrentPage(newCurrentPage:  currentPage - 1 );

        },
        child: Container(
          width: 15,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              BootstrapIcons.chevron_left,
              color: Colors.black,
              size: 15,
            ),
          ),
        ),
      ),
    );

  }

}