// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'name.dart';

part 'vehicle_categories.g.dart';

@JsonSerializable()
class VehicleCategories {
  const VehicleCategories({
    required this.category,
    required this.vignetteCategory,
    required this.name,
  });
  
  factory VehicleCategories.fromJson(Map<String, Object?> json) => _$VehicleCategoriesFromJson(json);
  
  final String category;
  final String vignetteCategory;
  final Name name;

  Map<String, Object?> toJson() => _$VehicleCategoriesToJson(this);
}
