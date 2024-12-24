import 'package:meta/meta.dart';

@immutable
class LoginParams {

  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

}
