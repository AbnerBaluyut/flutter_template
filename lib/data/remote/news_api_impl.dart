import 'package:get/get.dart';
import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/models/headline/headline_response.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';
import 'package:my_flutter_project/service/http_service.dart';
import 'package:my_flutter_project/service/http_service_impl.dart';

class NewsApiImpl implements NewsApi {

  late HttpService _httpService;

  NewsApiImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Article>> getTopHeadlines(String country, {required ErrorFunction? onError}) async {
    try {
      final response = await _httpService.getRequest("v2/top-headlines?country=$country");
      return Headline.fromJson(response.data).articles;
    } on Exception catch (e) {
      onError?.call(e.toString());
      return <Article>[];
    }
  }

  @override
  Future<List<Article>> getSourceById(String sourceId, {required ErrorFunction? onError}) async {
    try {
      final response = await _httpService.getRequest("v2/top-headlines?sources=$sourceId");
      return Headline.fromJson(response.data).articles;
    } catch (e) {
       onError?.call(e.toString());
      return <Article>[];
    }
  }

  @override
  Future<List<Article>> searchNews(String query, {required ErrorFunction? onError}) async {
    try {
      final response = await _httpService.getRequest("/v2/everything?q=$query");
      return Headline.fromJson(response.data).articles;
    } catch (e) {
       onError?.call(e.toString());
      return <Article>[];
    }
  }
}