import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable(includeIfNull: false)
class Source {

  @JsonKey(name: "id")  
  String? id;

  @JsonKey(name: "name")
  String name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}