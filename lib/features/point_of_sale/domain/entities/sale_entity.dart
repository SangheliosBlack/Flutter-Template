import 'package:flutter_template/core/resources/mappable.dart';

class Sale extends Mappable {

  final int id;
  final String cliente;
  final double total;
  final DateTime fecha;

  Sale({
    required this.id,
    required this.cliente,
    required this.total,
    required this.fecha,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'ClSSiente': cliente,
      'Total': total,
      'Fecha': fecha.toIso8601String(),
    };
  }
  
}
