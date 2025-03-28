// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'object0.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Object0 _$Object0FromJson(Map<String, dynamic> json) => Object0(
  highwayOrders:
      (json['highwayOrders'] as List<dynamic>)
          .map((e) => HighwayOrders.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$Object0ToJson(Object0 instance) => <String, dynamic>{
  'highwayOrders': instance.highwayOrders,
};
