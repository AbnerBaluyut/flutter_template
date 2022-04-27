import 'package:get/get.dart';
import 'package:my_flutter_project/data/repositories/search_repository/search_repository.dart';
import 'package:my_flutter_project/data/repositories/search_repository/search_repository_impl.dart';
import 'package:my_flutter_project/screens/search_module/controller/search_controller.dart';

class SearchBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<SearchRepository>(SearchRepositoryImpl(newsApi: Get.find()));
    Get.put(SearchController(searchRepository: Get.find()));
  }
}