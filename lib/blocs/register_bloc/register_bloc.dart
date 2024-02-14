import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc()
      : super(const RegisterState(
            name: '', email: '', phoneNumber: '', password: '', fatherLastName: '', motherLastName: '')) {
    on<EditRegisterEvent>(_editRegister);
  }

  _editRegister(EditRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterState(
        name: event.name,
        email: event.email,
        phoneNumber: event.phoneNumber,
        password: event.password, fatherLastName: event.fatherLastName, motherLastName: event.motherLastName));
  }
}
