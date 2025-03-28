// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'payload.dart';

part 'get_v1_highway_info_response.g.dart';

@JsonSerializable()
class GetV1HighwayInfoResponse {
  const GetV1HighwayInfoResponse({
    required this.requestId,
    required this.statusCode,
    required this.payload,
  });
  
  factory GetV1HighwayInfoResponse.fromJson(Map<String, Object?> json) => _$GetV1HighwayInfoResponseFromJson(json);
  
  final int requestId;
  final String statusCode;
  final Payload payload;

  Map<String, Object?> toJson() => _$GetV1HighwayInfoResponseToJson(this);
}
