// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      urlImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) {
  final val = <String, dynamic>{
    'source': instance.source,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author', instance.author);
  val['title'] = instance.title;
  writeNotNull('description', instance.description);
  val['url'] = instance.url;
  writeNotNull('urlToImage', instance.urlImage);
  val['publishedAt'] = instance.publishedAt;
  writeNotNull('content', instance.content);
  return val;
}