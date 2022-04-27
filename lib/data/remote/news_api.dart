import 'package:my_flutter_project/data/models/article/article.dart';

typedef ErrorFunction = void Function(String);

abstract class NewsApi {
  
  Future<List<Article>?> getTopHeadlines(String country, {required ErrorFunction? onError});

  Future<List<Article>> getSourceById(String sourceId, {required ErrorFunction? onError});

  Future<List<Article>> searchNews(String query, {required ErrorFunction? onError});
}