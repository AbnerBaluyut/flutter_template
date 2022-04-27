import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';
import 'package:my_flutter_project/data/repositories/home_repository/home_repository.dart';


class HomeRepositoryImpl implements HomeRepository {

  NewsApi newsApi;
  HomeRepositoryImpl({required this.newsApi});
  
  @override
  Future<List<Article>?> getTopHeadlines(String country, {required ErrorFunction? onError}) {
    return newsApi.getTopHeadlines(country, onError: (p0) => onError?.call(p0));
  }
}