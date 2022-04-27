import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';
import 'package:my_flutter_project/data/repositories/search_repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {

  NewsApi newsApi;
  SearchRepositoryImpl({required this.newsApi});

  @override
  Future<List<Article>?> searchNews(String query, {required ErrorFunction? onError}) {
    return newsApi.searchNews(query, onError: (e) => onError?.call(e));
  }
}