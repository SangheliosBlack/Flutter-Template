import 'package:flutter_template/features/point_of_sale/presentation/domain/entities/entities.dart';

class ClientsState {

  final Map<String, ClientEntity> clientList;

  ClientsState({
    this.clientList = const {},
  });

  ClientsState copyWith({
    Map<String, ClientEntity>? clientList,
  }) {
    return ClientsState(
      clientList: clientList ?? this.clientList,
    );
  }

}