import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonPaginator extends ConsumerWidget {

  final bool active;
  final int index;
  final bool limit;

  const ButtonPaginator({
    super.key,
    required this.active,
    required this.index,
    required this.limit
  });

  @override
  Widget build(BuildContext context,ref) {

    return GestureDetector(
      onTap: (){

        if(limit) return;

        ref.read(coolDataTableProvider.notifier).updateCurrentPage(newCurrentPage: index);

      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        width: active ? 32 : 32,
        height: 32,
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: active ? AppTheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            index.toString(),
            style: GoogleFonts.poppins(
              color: active ? Colors.white : Colors.black,
            ),
          ),
        )
      ),
    );

  }
  
}