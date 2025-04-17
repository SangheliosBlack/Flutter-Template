import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/features/point_of_sale/domain/entities/client_form_state.dart';

class FormStateNotifier extends StateNotifier<ClientFormState> {

  FormStateNotifier() : super(ClientFormState());

  void updateName({required String value}) => state = state.copyWith(name: value);

  void updatePhone({required String value}) => state = state.copyWith(phone: value);

  void updateAddress({required String value}) => state = state.copyWith(address: value);

  void updateReference({required String value}) => state = state.copyWith(reference: value);

  void resetForm() => state = ClientFormState();
 
}

final clientFormProvider = StateNotifierProvider<FormStateNotifier, ClientFormState>(
  (ref) => FormStateNotifier(),
);
