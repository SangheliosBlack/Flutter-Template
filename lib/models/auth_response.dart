import 'dart:convert';

import 'package:skeleton/helpers/service_message.dart';


class AuthResponse<T> {
  AuthResponse(
      {required this.status,
      required this.message,
      this.usuario,
      });

  String status;
  String message;
  Usuario? usuario;
}

class AuthRSuccess<T> extends AuthResponse<T> {
  AuthRSuccess(
      {String message = ServiceMessages.messageSuccess,
      Usuario? usuario,
      })
      : super(
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

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  dynamic alias;
  String email;
  String firstName;
  String fatherLastName;
  String motherLastName;
  dynamic profilePhoto;
  dynamic phone;
  bool active;
  DateTime createdAt;
  Company company;

  Usuario({
    required this.id,
    required this.alias,
    required this.email,
    required this.firstName,
    required this.fatherLastName,
    required this.motherLastName,
    required this.profilePhoto,
    required this.phone,
    required this.active,
    required this.createdAt,
    required this.company,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        alias: json["alias"],
        email: json["email"],
        firstName: json["first_name"],
        fatherLastName: json["father_last_name"],
        motherLastName: json["mother_last_name"],
        profilePhoto: json["profile_photo"],
        phone: json["phone"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alias": alias,
        "email": email,
        "first_name": firstName,
        "father_last_name": fatherLastName,
        "mother_last_name": motherLastName,
        "profile_photo": profilePhoto,
        "phone": phone,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "company": company.toJson(),
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
