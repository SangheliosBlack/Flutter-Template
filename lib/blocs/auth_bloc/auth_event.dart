part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class IsLoggedIn extends AuthEvent {
  @override
  List<Object> get props => [];
}

class EditActiveUser extends AuthEvent {
  const EditActiveUser();

  @override
  List<Object> get props => [];
}

class LoginGuest extends AuthEvent {
  final String email;
  final String firstName;
  final String fatherLastName;
  final String motherLastName;
  final String phone;
  final String password;

  const LoginGuest( { required this.email,required this.firstName,required this.fatherLastName,
   required   this.motherLastName,required this.phone,required this.password});

  @override
  List<Object> get props =>
      [email, firstName, fatherLastName, motherLastName, phone, password];
}

