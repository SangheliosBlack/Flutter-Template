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
