// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'highway_orders.g.dart';

@JsonSerializable()
class HighwayOrders {
  const HighwayOrders({
    required this.type,
    required this.category,
    required this.cost,
  });
  
  factory HighwayOrders.fromJson(Map<String, Object?> json) => _$HighwayOrdersFromJson(json);
  
  final String type;
  final String category;
  final double cost;

  Map<String, Object?> toJson() => _$HighwayOrdersToJson(this);
}
