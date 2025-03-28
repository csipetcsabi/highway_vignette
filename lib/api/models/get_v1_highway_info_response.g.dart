// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_v1_highway_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetV1HighwayInfoResponse _$GetV1HighwayInfoResponseFromJson(
  Map<String, dynamic> json,
) => GetV1HighwayInfoResponse(
  requestId: json['requestId'] as String,
  statusCode: json['statusCode'] as String,
  payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetV1HighwayInfoResponseToJson(
  GetV1HighwayInfoResponse instance,
) => <String, dynamic>{
  'requestId': instance.requestId,
  'statusCode': instance.statusCode,
  'payload': instance.payload,
};
