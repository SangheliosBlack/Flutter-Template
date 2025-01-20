
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cool_data_table_provider.g.dart';


@Riverpod(keepAlive: true)
class CoolDataTable extends _$CoolDataTable {

  @override 
  CoolDataTableState  build (){

    return CoolDataTableState();

  }

  void updateShowQuantity({required int quantity, bool firstTime = false}){

    if(firstTime){

      if(state.showQuantity == 0){

        state = state.copyWith(
          showQuantity: quantity,
          currentPage: 1
        ); 

      }

      return;

    }

    state = state.copyWith(
      showQuantity: quantity,
      currentPage: 1
    ); 

  }

  void updateCurrentPage({required int newCurrentPage}){

    state = state.copyWith(
      currentPage: newCurrentPage,
    );

  }


}