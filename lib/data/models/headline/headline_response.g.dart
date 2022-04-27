// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headline_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headline _$HeadlineFromJson(Map<String, dynamic> json) => Headline(
      status: json['status'] as String,
      results: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HeadlineToJson(Headline instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.results,
      'articles': instance.articles,
    };
