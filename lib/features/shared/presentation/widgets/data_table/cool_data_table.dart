import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/resources/mappable.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';
import 'package:flutter_template/features/shared/presentation/widgets/data_table/data_table.dart';
import 'package:flutter_template/features/shared/presentation/widgets/data_table/row/row.dart';
import 'package:flutter_template/features/shared/presentation/widgets/widgets.dart';
import 'package:flutter_template/helpers/extensions.dart';

class CoolDataTable<T extends Mappable> extends ConsumerWidget {

  final List<RowHeader> headers;
  final List<T> data;
  final bool isSelectable;
  final String? title;
  final List<RowCell> Function(T item) buildRow;
  final List<int>? cellsPerPage;
  final int? totalDocuments;

  const CoolDataTable({
    super.key,
    required this.data,
    required this.headers,
    required this.buildRow,
    this.isSelectable = false,
    this.title = "",
    this.cellsPerPage,
    this.totalDocuments
  });

  @override
  Widget build(BuildContext context,ref) {

     const List<int> defaultCellsPerPage = [10,25,30];
  
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(coolDataTableProvider.notifier).updateShowQuantity(
        quantity: cellsPerPage != null ? cellsPerPage![0] : defaultCellsPerPage[0],
        firstTime: true
      );
    });

   final List<Widget> rows = data.map((item) {

      final cells = buildRow(item); 

      return RowCellCreation(
        widgets: cells,
      );

    }).toList();

    if (headers.isEmpty) {
      return _buildError('Headers cannot be empty.');
    }

    if (rows.isEmpty) {
      return _buildError('Rows cannot be empty.');
    }

    return Container(
      height: context.height - 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderLabel(
            title: title ?? "",
          ),
          //StatusFilter(),
          //ListFilter(),
          _buildHeaders(headers),
          _buildRows(rows),
          PaginatorDataTable(
            data: data, 
            cellsPerPage: cellsPerPage ?? defaultCellsPerPage, 
            totalDocuments: totalDocuments ?? 0,
          )
        ],
      ),
    );
  }

  Widget _buildHeaders(List<RowHeader> headers) {
    return Container(
      margin: EdgeInsets.only(
      ),
      height: 50,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.withValues(
              alpha: .1
            )
          )
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(left: isSelectable ? 40 : 0),
        child: Row(
          children: headers
              .map((header) => header)
              .toList(),
        ),
      ),
    );
  }
Widget _buildRows(List<Widget> rows) {
  return Expanded(
    child: RefreshIndicator(
      onRefresh: () async { 
    
        return;
    
      },
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 0),
        itemCount: rows.length,
        itemBuilder: (context, rowIndex) {
          final cells = rows[rowIndex]; // Ahora 'cells' es un solo widget
      
          return Container(
            decoration: BoxDecoration(
              color: rowIndex % 2 == 0
                  ? Colors.white
                  : const Color.fromARGB(255, 252, 252, 252),
            ),
            child: Row(
              children: [
                if (isSelectable)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: SimpleCheckButton(),
                  ),
                Expanded(child: cells), // Pasamos directamente el widget (ya no es necesario .map())
              ],
            ),
          );
        },
        separatorBuilder: (_, __) => Divider(
          color: Colors.grey.withValues(
            alpha: .05,
          ),
          height: 1,
        ),
      ),
    ),
  );
}



  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 40),
          const SizedBox(height: 10),
          Text(
            message,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
