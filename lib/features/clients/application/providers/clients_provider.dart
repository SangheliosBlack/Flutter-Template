import 'package:collection/collection.dart';
import 'package:flutter_template/features/clients/domain/entities/clients_state.dart';
import 'package:flutter_template/features/point_of_sale/application/providers/forms/client_form.dart';
import 'package:flutter_template/features/point_of_sale/presentation/providers/order_cart/order_cart_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../point_of_sale/presentation/domain/entities/entities.dart';

part 'clients_provider.g.dart';

@Riverpod(keepAlive: true)
class Clients extends _$Clients {

  @override
  ClientsState build() {
    return ClientsState();
  }

ClientEntity? getClientByPhone({required String phone}) {

  final ClientEntity? client = state.clientList.values.firstWhereOrNull(
    (client) => client.phone.replaceAll(" ", "").trim() == phone,
  );

  if(client != null) {

    ref.read(orderCartProvider.notifier).setClient(client: client);

    return client;

  } else {

    ref.read(orderCartProvider.notifier).removeClient();

    return null;

  }

}

ClientEntity? getClientById({required String id}) {

  final ClientEntity? client = state.clientList[id];

  if(client != null) {

    ref.read(orderCartProvider.notifier).setClient(client: client);

    return client;

  } else {

    ref.read(orderCartProvider.notifier).removeClient();

    return null;

  }

}

  void addClient({required bool addInmediately}) {

    final clientFormState = ref.read(clientFormProvider);

    final ClientEntity newClient = ClientEntity(
      id: (DateTime.now().millisecondsSinceEpoch % 1000).toString(),
      name: clientFormState.name, 
      phone: clientFormState.phone.replaceAll(" ", "").trim(), 
      address: clientFormState.address, 
      reference: clientFormState.reference
    );

    if(addInmediately) {

      ref.read(orderCartProvider.notifier).setClient(client: newClient);

    }

    final updatedMap = Map<String, ClientEntity>.from(state.clientList);

    updatedMap[newClient.id] = newClient;

    state = state.copyWith(clientList: updatedMap);

  }

  void removeClient({required ClientEntity client}) {

    final updatedMap = Map<String, ClientEntity>.from(state.clientList);

    updatedMap.remove(client.id);

    state = state.copyWith(clientList: updatedMap);

  }

  void updateClient({required ClientEntity client}) {

    final updatedMap = Map<String, ClientEntity>.from(state.clientList);

    updatedMap[client.id] = client;

    state = state.copyWith(clientList: updatedMap);

  }
}