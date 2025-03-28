// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_v1_highway_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostV1HighwayOrderResponse _$PostV1HighwayOrderResponseFromJson(
  Map<String, dynamic> json,
) => PostV1HighwayOrderResponse(
  statusCode: json['statusCode'] as String,
  receivedOrders:
      (json['receivedOrders'] as List<dynamic>)
          .map((e) => ReceivedOrders.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$PostV1HighwayOrderResponseToJson(
  PostV1HighwayOrderResponse instance,
) => <String, dynamic>{
  'statusCode': instance.statusCode,
  'receivedOrders': instance.receivedOrders,
};
