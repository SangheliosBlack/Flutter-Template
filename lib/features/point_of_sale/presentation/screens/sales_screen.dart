import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/entities.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/sales/sales_provider.dart';

import '../../../shared/presentation/widgets/data_table/cool_data_table.dart';
import '../../../shared/presentation/widgets/data_table/row/row.dart';

class SalesScreen extends ConsumerWidget {

  static const String path = "/point-of-sale/sales";

  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final salesList = ref.watch(salesProvider).salesList;

    return Container(
      color: AppTheme.backgroundColor,
      child: Padding(
        padding: EdgeInsets.only(
          top: 45
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25
              ),
              child: CoolDataTable<Sale>(
                title: "Ventas",
                data: salesList.values.toList(), 
                cellsPerPage: [
                  20,30,50,100
                ],
                totalDocuments: 126,
                headers: [
                  RowHeader(
                    title: 'Id',
                    alignment: Alignment.center,
                    width: 60
                  ),
                  RowHeader(title: 'Nombre', alignment: Alignment.centerLeft),
                  RowHeader(title: 'Total',alignment: Alignment.centerLeft),
                  RowHeader(
                    title: 'Fecha',
                    alignment: Alignment.centerLeft,
                  ),
                ], 
                buildRow: (Sale sale) {     
                  return [
                    RowCell(
                      width: 60,
                      text: sale.id.toString(),
                      alignment: Alignment.center,
                    ),
                    RowCell(
                      text: sale.cliente,
                    ),
                    RowCell(
                      text: sale.total.toStringAsFixed(2)
                    ),
                    RowCell(
                      text:sale.fecha.toString()
                    )
                  ];
                },
              ),
            )
          ],
        ),
      ),
    );

  }

}