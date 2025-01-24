import 'package:flutter/material.dart';

class MenuOptionEntity{
  String titulo;
  IconData icono;
  List<String> subMenu;

  MenuOptionEntity({
    required this.titulo,
    required this.icono,
    required this.subMenu
  });

}