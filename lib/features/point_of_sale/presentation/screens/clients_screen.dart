import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/clients/application/application.dart';
import 'package:flutter_template/features/point_of_sale/presentation/domain/domain.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/sales/sales_provider.dart';

import 'package:flutter_template/core/config/themes/main_theme.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/entities.dart';


import '../../../shared/presentation/widgets/data_table/cool_data_table.dart';
import '../../../shared/presentation/widgets/data_table/row/row.dart';


class ClientsScreen extends ConsumerWidget {

  static const String path = "/point-of-sale/clients";

  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context,ref) {

    final clientsList = ref.watch(clientsProvider).clientList;

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
              child: CoolDataTable<ClientEntity>(
                title: "Clientes",
                data: clientsList.values.toList(), 
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
                  RowHeader(
                    title: 'No. celular',
                    alignment: Alignment.centerLeft,
                    width: 120,
                  ),
                  RowHeader(title: 'Nombre', alignment: Alignment.centerLeft),
                  RowHeader(
                    title: 'Direccion',
                    alignment: Alignment.centerLeft,
                  ),
                  RowHeader(
                    title: 'Referencias',
                    alignment: Alignment.centerLeft,
                  ),
                ], 
                buildRow: (ClientEntity client) {     
                  return [
                    RowCell(
                      width: 60,
                      text: client.id.toString(),
                      alignment: Alignment.center,
                    ),
                    RowCell(
                      width: 120,
                      text: client.formattedPhone
                    ),
                    RowCell(
                      text: client.name,
                    ),
                    RowCell(
                      text:client.address
                    ),
                    RowCell(
                      text:client.reference
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