import 'dart:convert';

import 'package:flutter_template/helpers/service_message.dart';

class AuthResponse<T> {
  AuthResponse({
    required this.status,
    required this.message,
    this.usuario,
  });

  String status;
  String message;
  Usuario? usuario;
}

class AuthRSuccess<T> extends AuthResponse<T> {
  AuthRSuccess({
    String message = ServiceMessages.messageSuccess,
    Usuario? usuario,
  }) : super(
          status: ServiceMessages.success,
          message: message,
          usuario: usuario,
        );
}

class AuthRError<T> extends AuthResponse<T> {
  AuthRError({
    String message = ServiceMessages.messageError,
    Usuario? usuario,
  }) : super(
          status: ServiceMessages.messageError,
          message: message,
          usuario: usuario,
        );
}

List<Usuario> listUsuarioFromJson(List<dynamic> jsonList){
  return jsonList.map((json) => Usuario.fromJson(json)  ).toList();
}

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  String uid;
  String email;
  String name;
  String phone;
  bool online;
  String role;
  DateTime createdAt;

  Usuario({
    required this.role,
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.online,
    required this.createdAt,
  });
  Usuario copyWith({
    String? role,
    String? uid,
    String? email,
    String? name,
    String? phone,
    bool? online,
    DateTime? createdAt,
  }) {
    return Usuario(
      role: role ?? this.role,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      online: online ?? this.online,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        uid: json["uid"],
        email: json["email"],
        phone: json["phone"],
        online: json["online"],
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"], role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": uid,
        "email": email,
        "online": online,
        "active": online,
        "created_at": createdAt.toIso8601String(),
      };
}

class Company {
  int id;
  String name;
  String code;

  Company({
    required this.id,
    required this.name,
    required this.code,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}
