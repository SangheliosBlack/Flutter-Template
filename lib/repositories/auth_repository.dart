import 'dart:convert';

import 'package:skeleton/models/auth_response.dart';
import 'package:skeleton/services/http_service.dart';


class AuthRepository {
  final HttpService httpService;

  AuthRepository({required this.httpService});

  Future<AuthResponse<String>> login(
      {required String userName, required String password}) async {
    try {
      final response = await httpService.post(
          path: '/api/v1/login',
          data: {'email': userName, 'password': password});

      final result = (jsonDecode(response.body));

      httpService.actualizarToken(result["accessToken"]);

      final responseGetMe = await httpService.get(
        path: '/api/v1/users/me',
      );

      final result2 = (jsonDecode(responseGetMe.body));

      switch (response.statusCode) {
        case 200:
          return AuthRSuccess<String>(
            message: result["message"] ?? 'not message',
            usuario: Usuario.fromJson(result2["doc"]["data"]),
          );
        default:
          return AuthRError(message: result["message"]);
      }
    } catch (e) {
      return AuthRError();
    }
  }

  Future<AuthResponse<String>> isLoggedIn() async {
    try {
      final response = await httpService.get(
        path: '/api/v1/users/me',
      );

      final result = (jsonDecode(response.body));

      switch (response.statusCode) {
        case 200:
          return AuthRSuccess<String>(
            message: result["message"] ?? "not message",
            usuario: Usuario.fromJson(result["doc"]["data"]),
          );
        default:
          return AuthRError(message: result["message"]);
      }
    } catch (e) {
      return AuthRError();
    }
  }
}
