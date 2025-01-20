import 'package:flutter_template/features/point_of_sale/domain/entities/sale_entity.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/sales/sales_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sales_provider.g.dart';

@Riverpod(keepAlive:true)
class Sales extends _$Sales{

  @override
  SalesState build(){

    return SalesState(
      
    );    

  }

  void addSale({required Sale sale }){

    final updateMap = Map<int,Sale>.from(state.salesList);
    updateMap[sale.id] = sale;
    state = state.copyWith(salesList: updateMap);

  }

}