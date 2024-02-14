import 'dart:convert';

import 'package:flutter_template/models/auth_response.dart';
import 'package:flutter_template/models/general_response.dart';
import 'package:flutter_template/services/http_service.dart';

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

   Future<GeneralResponse> createGuest(
      {required String email,
      required String firstName,
      required String fatherLastName,
      required String motherLastName,
      required String phone,
      required String password}) async {
    List<String> nombre = [firstName, fatherLastName, motherLastName];
    final data = {
      "email": email,
      "name": nombre.join(" "),
      "phone": phone.replaceAll(" ", ""),
      "password": password,
      "confirm_password": password,
      "role": "CLIEN"
    };

    try {
      final response =
          await httpService.post(path: '/api/v1/auth/createUser', data: data);

      final result = (jsonDecode(response.body));

      switch (response.statusCode) {
        case 200:
          httpService.actualizarToken(result["doc"]["data"]["accessToken"]);
          return ResponseSuccess<Usuario>(
              message: result["message"] ?? "not message",
              data: Usuario.fromJson(result["doc"]["data"]["user"]));
        default:
          return ResponseError(
              message: result["details"][0]["message"] ?? result["message"]);
      }
    } catch (e) {
      return ResponseError(message: 'Unknow error');
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
