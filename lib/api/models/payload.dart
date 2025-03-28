// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'highway_vignettes.dart';
import 'vehicle_categories.dart';
import 'counties.dart';

part 'payload.g.dart';

@JsonSerializable()
class Payload {
  const Payload({
    required this.highwayVignettes,
    required this.vehicleCategories,
    required this.counties,
  });
  
  factory Payload.fromJson(Map<String, Object?> json) => _$PayloadFromJson(json);
  
  final List<HighwayVignettes> highwayVignettes;
  final List<VehicleCategories> vehicleCategories;
  final List<Counties> counties;

  Map<String, Object?> toJson() => _$PayloadToJson(this);
}
