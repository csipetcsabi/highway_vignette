// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highway_orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighwayOrders _$HighwayOrdersFromJson(Map<String, dynamic> json) =>
    HighwayOrders(
      type: json['type'] as String,
      category: json['category'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$HighwayOrdersToJson(HighwayOrders instance) =>
    <String, dynamic>{
      'type': instance.type,
      'category': instance.category,
      'cost': instance.cost,
    };
