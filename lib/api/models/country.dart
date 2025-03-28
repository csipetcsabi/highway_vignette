// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  const Country({
    required this.hu,
    required this.en,
  });
  
  factory Country.fromJson(Map<String, Object?> json) => _$CountryFromJson(json);
  
  final String hu;
  final String en;

  Map<String, Object?> toJson() => _$CountryToJson(this);
}
