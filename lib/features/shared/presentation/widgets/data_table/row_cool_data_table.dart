import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/shared/presentation/widgets/data_table/row/row.dart';
import 'package:gap/gap.dart';

class RowCoolDataTable extends StatelessWidget {
  
  final List<RowCell> fields;

  const RowCoolDataTable({
    super.key,
    required this.fields
  });

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
      itemCount: fields.length, 
      itemBuilder: (_,i) {  

        return fields[i];

      }, 
      separatorBuilder: (_,__) => Gap(10),
    );

  }
  
}