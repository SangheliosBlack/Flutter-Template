part of 'register_bloc.dart';

class RegisterState extends Equatable {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String fatherLastName;
  final String motherLastName;

  const RegisterState(
      {required this.name,
      required this.email,
      required this.fatherLastName,
      required this.motherLastName,
      required this.phoneNumber,
      required this.password});

  RegisterState copyWith(
      {String? newName,
      String? newEmail,
      String? newFatherLastName,
      String? newMotherLastName,
      String? newPhoneNumber,
      String? newPassword}) {
    return RegisterState(
      name: newName ?? name,
      email: newEmail ?? email,
      phoneNumber: newPhoneNumber ?? phoneNumber,
      password: newPassword ?? password,
      fatherLastName: newFatherLastName ?? fatherLastName,
      motherLastName: newMotherLastName ?? motherLastName,
    );
  }

  @override
  List<Object> get props => [name, email, phoneNumber];
}
