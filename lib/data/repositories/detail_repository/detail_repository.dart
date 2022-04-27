
import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';

abstract class DetailRepository {

  Future<List<Article>?> getNewsById(String sourceId, {required ErrorFunction? onError});
}