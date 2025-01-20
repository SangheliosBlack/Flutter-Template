import 'package:flutter_template/features/point_of_sale/domain/entities/sale_entity.dart';

class SalesState {
  final Map<int, Sale> salesList;

  // Constructor con un valor por defecto
  SalesState({Map<int, Sale>? salesList})
      : salesList = salesList ?? {
          1: Sale(
            id: 1,
            cliente: 'Juan Pérez',
            total: 100.0,
            fecha: DateTime.now(),
          ),
          2: Sale(
            id: 2,
            cliente: 'María García',
            total: 200.0,
            fecha: DateTime.now().subtract(Duration(days: 1)),
          ),
          3: Sale(
            id: 3,
            cliente: 'Carlos López',
            total: 300.0,
            fecha: DateTime.now().subtract(Duration(days: 2)),
          ),
          4: Sale(
            id: 4,
            cliente: 'Ana Martínez',
            total: 400.0,
            fecha: DateTime.now().subtract(Duration(days: 3)),
          ),
          5: Sale(
            id: 5,
            cliente: 'Luis Fernández',
            total: 500.0,
            fecha: DateTime.now().subtract(Duration(days: 4)),
          ),
        };

  SalesState copyWith({
    Map<int, Sale>? salesList,
  }) {
    return SalesState(
      salesList: salesList ?? this.salesList,
    );
  }
}
