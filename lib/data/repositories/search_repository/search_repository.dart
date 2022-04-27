import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';

abstract class SearchRepository {

  Future<List<Article>?> searchNews(String query, {required ErrorFunction? onError});
}