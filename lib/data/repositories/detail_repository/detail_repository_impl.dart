import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';
import 'package:my_flutter_project/data/repositories/detail_repository/detail_repository.dart';

class DetailRepositoryImpl implements DetailRepository {

  NewsApi newsApi;
  DetailRepositoryImpl({required this.newsApi});

  @override
  Future<List<Article>?> getNewsById(String sourceId, {required ErrorFunction? onError}) {
    return newsApi.getSourceById(sourceId, onError: (e) => onError?.call(e));
  }
}