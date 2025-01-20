import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CurerrentDataLabel extends ConsumerWidget {

  final int dataLenght;
  final int totalDocuments;
  final int totalPages;
  
  const CurerrentDataLabel({
    super.key,
    required this.dataLenght,
    required this.totalDocuments,
    required this.totalPages
  });

  @override
  Widget build(BuildContext context,ref) {

    final coolDataState = ref.watch(coolDataTableProvider);

    int from = (coolDataState.currentPage - 1) * coolDataState.showQuantity;

    int to = ((coolDataState.currentPage - 1) * coolDataState.showQuantity) + coolDataState.showQuantity;

    if(coolDataState.currentPage >= totalPages){

      to = ((coolDataState.currentPage - 1) * coolDataState.showQuantity) + totalDocuments % coolDataState.showQuantity;

    }

    return Container(
      margin: EdgeInsets.only(
        right: 15
      ),
      child: Text(
        "$from - $to ${totalDocuments == 0 ? "": " de $totalDocuments"} resultados",
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 12
        ),
      ),
    );
    
  }

}