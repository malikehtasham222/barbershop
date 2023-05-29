import 'dart:ui';

import 'package:barbershop_new/src/models/service_model.dart';

class CategoryModel {
  final String? name;
  final String? icon;
  final Color? color;
  final List<ServicesModel>? services;

  CategoryModel({
    this.name,
    this.icon,
    this.color,
    this.services, 
  });
}
