// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceivedOrders _$ReceivedOrdersFromJson(Map<String, dynamic> json) =>
    ReceivedOrders(
      type: json['type'] as String,
      category: json['category'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$ReceivedOrdersToJson(ReceivedOrders instance) =>
    <String, dynamic>{
      'type': instance.type,
      'category': instance.category,
      'cost': instance.cost,
    };
