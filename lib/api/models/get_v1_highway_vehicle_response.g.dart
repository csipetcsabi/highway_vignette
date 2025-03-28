// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_v1_highway_vehicle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetV1HighwayVehicleResponse _$GetV1HighwayVehicleResponseFromJson(
  Map<String, dynamic> json,
) => GetV1HighwayVehicleResponse(
  statusCode: json['statusCode'] as String,
  internationalRegistrationCode:
      json['internationalRegistrationCode'] as String,
  type: json['type'] as String,
  name: json['name'] as String,
  plate: json['plate'] as String,
  country: Country.fromJson(json['country'] as Map<String, dynamic>),
  vignetteType: json['vignetteType'] as String,
);

Map<String, dynamic> _$GetV1HighwayVehicleResponseToJson(
  GetV1HighwayVehicleResponse instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'internationalRegistrationCode': instance.internationalRegistrationCode,
  'type': instance.type,
  'name': instance.name,
  'plate': instance.plate,
  'country': instance.country,
  'vignetteType': instance.vignetteType,
};
