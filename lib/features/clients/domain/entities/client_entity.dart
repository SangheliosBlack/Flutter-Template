import 'package:flutter_template/core/resources/mappable.dart';
import 'package:meta/meta.dart';

@immutable
class ClientEntity extends Mappable {
  
  final String id;
  String get formattedPhone {
    final sanitizedPhone = phone.replaceAll(' ', '');

    final buffer = StringBuffer();

    if (sanitizedPhone.length == 10) {
      buffer.write(sanitizedPhone.substring(0, 3));
      buffer.write(' - ');
      buffer.write(sanitizedPhone.substring(3, 6));
      buffer.write(' - ');
      buffer.write(sanitizedPhone.substring(6));
    } else {
      buffer.write(sanitizedPhone); 
    }
    return buffer.toString();
  }
  final String name;
  final String phone;
  final String address;
  final String reference;

  ClientEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.reference
  });
  
  @override
  Map<String, dynamic> toMap() {
    return {
    'id': id,
    'name': name,
    'phone': phone,
    'address': address,
    'reference': reference,
    };
  }
  
  factory ClientEntity.fromMap(Map<String, dynamic> map) {
    return ClientEntity(
    id: map['id'] as String,
    name: map['name'] as String,
    phone: map['phone'] as String,
    address: map['address'] as String,
    reference: map['reference'] as String,
    );
  }
}
