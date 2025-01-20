import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/shared/presentation/providers/cool_data_table.dart/cool_data_table_provider.dart';
import 'package:flutter_template/features/shared/presentation/widgets/data_table/paginator/paginator.dart';

class PaginatorDataTable<T> extends ConsumerWidget {

  final List<T> data;
  final List<int> cellsPerPage;
  final int totalDocuments;

  const PaginatorDataTable({
    super.key,
    required this.totalDocuments,
    required this.data,
    required this.cellsPerPage,
  });

  @override
  Widget build(BuildContext context, ref) {

    final coolDataTable = ref.watch(coolDataTableProvider);

    double calculate = (totalDocuments / coolDataTable.showQuantity);

    int totalPages = 0;

    if (calculate.remainder(1) != 0) {
      
      totalPages = calculate.toInt() +1 ;

    } 

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withValues(alpha: .1),
            width: 1
          )
        )
      ),
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 15
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShowingEntries(
            dataLenght: data.length,
            cellsPerPage:cellsPerPage
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 5,
            children: [
              CurerrentDataLabel(
                dataLenght: data.length,
                totalDocuments:totalDocuments,
                totalPages: totalPages,
              ),       
              IndicatorDots(
                onTap: (){

                  ref.read(coolDataTableProvider.notifier).updateCurrentPage(newCurrentPage: 1);

                },
                reverse: true,
                index: 1,
                opacity: totalPages <= 3 ?  .2  : coolDataTable.currentPage  > 2 ? 1 : .2,
              ),
              PreviousButton(
                active: coolDataTable.currentPage != 1,
              ),
              Builder(
                builder: (context) {

                  int currentIndex = coolDataTable.currentPage == 1 ?  1 :(coolDataTable.currentPage - 1);

                  if(coolDataTable.currentPage == totalPages){

                    currentIndex = totalPages - 2;

                  }

                  return ButtonPaginator(
                    active: coolDataTable.currentPage == currentIndex,
                    index: currentIndex ,
                    limit: currentIndex >= totalPages ,
                  );
                }
              ),
              Builder(
                builder: (context) {

                  int currentIndex = coolDataTable.currentPage == 1 ? 2 : coolDataTable.currentPage;

                  if(coolDataTable.currentPage == totalPages){

                    currentIndex = totalPages - 1;

                  }

                  return ButtonPaginator(
                    active: coolDataTable.currentPage == currentIndex,
                    index: currentIndex,
                    limit: currentIndex >= totalPages ,
                  );
                }
              ),
              Builder(
                builder: (context) {

                  int currentIndex = coolDataTable.currentPage == 1 ? 3 : (coolDataTable.currentPage + 1);

                  if(coolDataTable.currentPage == totalPages){

                    currentIndex = totalPages;

                  }

                  return ButtonPaginator(
                    active: coolDataTable.currentPage == currentIndex ,
                    index: currentIndex,
                    limit: currentIndex > totalPages ,
                  );
                }
              ),
              NextButton(
                active: coolDataTable.currentPage != totalPages,
              ),
              IndicatorDots(
                onTap: (){

                  ref.read(coolDataTableProvider.notifier).updateCurrentPage(newCurrentPage: totalPages);

                },
                index: totalPages,
                opacity: totalPages <= 3 ?  .2  :  coolDataTable.currentPage + 2  <= totalPages  ? 1 : .2,
              ),
            ],
          ),
        ],
      ),
    );

  }

}