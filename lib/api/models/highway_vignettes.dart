// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'highway_vignettes.g.dart';

@JsonSerializable()
class HighwayVignettes {
  const HighwayVignettes({
    required this.vignetteType,
    required this.vehicleCategory,
    required this.cost,
    required this.trxFee,
    required this.sum,
  });
  
  factory HighwayVignettes.fromJson(Map<String, Object?> json) => _$HighwayVignettesFromJson(json);
  
  final List<String> vignetteType;
  final String vehicleCategory;
  final double cost;
  final double trxFee;
  final double sum;

  Map<String, Object?> toJson() => _$HighwayVignettesToJson(this);
}
