import 'package:flutter/widgets.dart';
import 'package:flutter_template/features/shared/presentation/widgets/data_table/data_table.dart';

class BodyDataTable extends StatelessWidget {

  const BodyDataTable({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        RowCoolDataTable(
          fields: [
          ]
        )
      ],
    );

  }

}