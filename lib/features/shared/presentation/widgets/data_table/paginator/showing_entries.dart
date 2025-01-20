import 'package:bootstrap_icons/bootstrap_icons.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_down_button/pull_down_button.dart';

class ShowingEntries extends ConsumerWidget {

  final int dataLenght;
  final List<int> cellsPerPage;

  const ShowingEntries({
    super.key,
    required this.dataLenght,
    required this.cellsPerPage
  });

  @override
  Widget build(BuildContext context,ref) {

    final int currentShowQuantity = ref.watch(coolDataTableProvider.select((state) => state.showQuantity));

    return Row(
      spacing: 10,
      children: [
        Text(
          "Mostrando",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 12
          ),
        ),
        PullDownButton(
          buttonAnchor: PullDownMenuAnchor.start,
          itemBuilder: (context) => cellsPerPage.map((i) => PullDownMenuItem.selectable(
              onTap: () {

                ref.read(coolDataTableProvider.notifier).updateShowQuantity(quantity: i);

              },
              selected: currentShowQuantity == i,
              title: i.toString() ,
              itemTheme: PullDownMenuItemTheme(
                checkmark: BootstrapIcons.check,
              ),
            ), ).toList() 
          ,
          animationBuilder: null,
          position: PullDownMenuPosition.automatic,
          buttonBuilder: (_,showMenu) => GestureDetector(
            onTap: showMenu,
            behavior: HitTestBehavior.translucent,
            child: Container(
              height: 35,
              padding: EdgeInsets.symmetric(
                horizontal:10
              ),
              decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Text(
                    (currentShowQuantity != 0 ? currentShowQuantity  : cellsPerPage[0]).toString() ,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 12
                    ),
                  ),
                  Icon(
                    BootstrapIcons.caret_down_fill,
                    color: Colors.black,
                    size: 14,
                  )
                ],
              ),
                    ),
          ),
        ),
      ],
    );

  }

}