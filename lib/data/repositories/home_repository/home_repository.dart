import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';

abstract class HomeRepository {

  Future<List<Article>?> getTopHeadlines(String country, {required ErrorFunction? onError});
}