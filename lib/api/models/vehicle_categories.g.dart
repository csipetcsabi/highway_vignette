// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleCategories _$VehicleCategoriesFromJson(Map<String, dynamic> json) =>
    VehicleCategories(
      category: json['category'] as String,
      vignetteCategory: json['vignetteCategory'] as String,
      name: Name.fromJson(json['name'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleCategoriesToJson(VehicleCategories instance) =>
    <String, dynamic>{
      'category': instance.category,
      'vignetteCategory': instance.vignetteCategory,
      'name': instance.name,
    };
