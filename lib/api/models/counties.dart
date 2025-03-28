// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'counties.g.dart';

@JsonSerializable()
class Counties {
  const Counties({
    required this.id,
    required this.name,
  });
  
  factory Counties.fromJson(Map<String, Object?> json) => _$CountiesFromJson(json);
  
  final String id;
  final String name;

  Map<String, Object?> toJson() => _$CountiesToJson(this);
}
