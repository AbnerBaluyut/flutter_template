import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_project/data/models/article/article.dart';

part 'headline_response.g.dart';

@JsonSerializable(includeIfNull: false)
class Headline {

  @JsonKey(name: "status")
  String status;

  @JsonKey(name: "totalResults")
  int results;

  @JsonKey(name: "articles")
  List<Article> articles;

  Headline({required this.status, required this.results, required this.articles});

  factory Headline.fromJson(Map<String, dynamic> json) => _$HeadlineFromJson(json);

  Map<String, dynamic> toJson() => _$HeadlineToJson(this);
}