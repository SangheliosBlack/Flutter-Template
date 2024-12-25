import 'package:flutter_template/features/point_of_sale/domain/domain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContantsData{

  static List deliveryTypes = [
    DeliveryTypeEntity(
      icon: FontAwesomeIcons.motorcycle,
      label: "A domicilio"
    ),
    DeliveryTypeEntity(
      icon: FontAwesomeIcons.personWalkingArrowRight,
      label: "Para llevar"
    ),
    DeliveryTypeEntity(
      icon: FontAwesomeIcons.utensils,
      label: "Mesa"
    ),
  ];

}