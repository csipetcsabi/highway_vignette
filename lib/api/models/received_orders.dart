// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'received_orders.g.dart';

@JsonSerializable()
class ReceivedOrders {
  const ReceivedOrders({
    required this.type,
    required this.category,
    required this.cost,
  });
  
  factory ReceivedOrders.fromJson(Map<String, Object?> json) => _$ReceivedOrdersFromJson(json);
  
  final String type;
  final String category;
  final double cost;

  Map<String, Object?> toJson() => _$ReceivedOrdersToJson(this);
}
