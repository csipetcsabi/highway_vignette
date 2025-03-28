// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'get_v1_highway_vehicle_response.g.dart';

@JsonSerializable()
class GetV1HighwayVehicleResponse {
  const GetV1HighwayVehicleResponse({
    required this.statusCode,
    required this.internationalRegistrationCode,
    required this.type,
    required this.name,
    required this.plate,
    required this.country,
    required this.vignetteType,
  });
  
  factory GetV1HighwayVehicleResponse.fromJson(Map<String, Object?> json) => _$GetV1HighwayVehicleResponseFromJson(json);
  
  final String statusCode;
  final String internationalRegistrationCode;
  final String type;
  final String name;
  final String plate;
  final Country country;
  final String vignetteType;

  Map<String, Object?> toJson() => _$GetV1HighwayVehicleResponseToJson(this);
}
