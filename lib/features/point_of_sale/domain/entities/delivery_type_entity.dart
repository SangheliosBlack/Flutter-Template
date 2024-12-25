
import 'package:flutter/material.dart';

@immutable
class DeliveryTypeEntity {

  final IconData icon;
  final String label; 

  const DeliveryTypeEntity({
    required this.icon,
    required this.label
  });

}