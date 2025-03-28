// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import

import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class Name {
  const Name({
    required this.hu,
    required this.en,
  });
  
  factory Name.fromJson(Map<String, Object?> json) => _$NameFromJson(json);
  
  final String hu;
  final String en;

  Map<String, Object?> toJson() => _$NameToJson(this);
}
