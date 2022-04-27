import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_project/data/models/source/source.dart';

part 'article.g.dart';

@JsonSerializable(includeIfNull: false)
class Article {

  @JsonKey(name: "source")
  Source source;
  
  @JsonKey(name: "author")
  String? author;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "url")
  String url;

  @JsonKey(name: "urlToImage")
  String? urlImage;

  @JsonKey(name: "publishedAt")
  String publishedAt;

  @JsonKey(name: "content")
  String? content;

  DateTime? get getPublishedDate => DateTime.tryParse(publishedAt);

  Article({required this.source, required this.author, required this.title, required this.description, required this.url, required this.urlImage, required this.publishedAt, required this.content});

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}