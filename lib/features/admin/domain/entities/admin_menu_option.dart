import 'package:flutter/material.dart';
import 'package:flutter_template/features/admin/domain/entities/admin_sub_menu_option.dart';

class MenuOptionEntity{
  String titulo;
  IconData icono;
  List<AdminSubMenuOption> subMenuOptions;

  MenuOptionEntity({
    required this.titulo,
    required this.icono,
    required this.subMenuOptions
  });

}