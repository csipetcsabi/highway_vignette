// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

import 'received_orders.dart';

part 'post_v1_highway_order_response.g.dart';

@JsonSerializable()
class PostV1HighwayOrderResponse {
  const PostV1HighwayOrderResponse({
    required this.statusCode,
    required this.receivedOrders,
  });
  
  factory PostV1HighwayOrderResponse.fromJson(Map<String, Object?> json) => _$PostV1HighwayOrderResponseFromJson(json);
  
  final String statusCode;
  final List<ReceivedOrders> receivedOrders;

  Map<String, Object?> toJson() => _$PostV1HighwayOrderResponseToJson(this);
}
