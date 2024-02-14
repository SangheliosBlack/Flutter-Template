part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EditRegisterEvent extends RegisterEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String fatherLastName;
  final String motherLastName;

  const EditRegisterEvent({
    required this.fatherLastName,
    required this.motherLastName,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object> get props =>
      [name, email, phoneNumber, password, fatherLastName, motherLastName];
}
