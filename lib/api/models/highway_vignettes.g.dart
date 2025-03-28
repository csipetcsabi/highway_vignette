// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'highway_vignettes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HighwayVignettes _$HighwayVignettesFromJson(Map<String, dynamic> json) =>
    HighwayVignettes(
      vignetteType:
          (json['vignetteType'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      vehicleCategory: json['vehicleCategory'] as String,
      cost: (json['cost'] as num).toDouble(),
      trxFee: (json['trxFee'] as num).toDouble(),
      sum: (json['sum'] as num).toDouble(),
    );

Map<String, dynamic> _$HighwayVignettesToJson(HighwayVignettes instance) =>
    <String, dynamic>{
      'vignetteType': instance.vignetteType,
      'vehicleCategory': instance.vehicleCategory,
      'cost': instance.cost,
      'trxFee': instance.trxFee,
      'sum': instance.sum,
    };
