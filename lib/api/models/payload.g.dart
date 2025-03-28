// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
  highwayVignettes:
      (json['highwayVignettes'] as List<dynamic>)
          .map((e) => HighwayVignettes.fromJson(e as Map<String, dynamic>))
          .toList(),
  vehicleCategories:
      (json['vehicleCategories'] as List<dynamic>)
          .map((e) => VehicleCategories.fromJson(e as Map<String, dynamic>))
          .toList(),
  counties:
      (json['counties'] as List<dynamic>)
          .map((e) => Counties.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
  'highwayVignettes': instance.highwayVignettes,
  'vehicleCategories': instance.vehicleCategories,
  'counties': instance.counties,
};
