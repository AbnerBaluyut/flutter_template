import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_project/data/remote/news_api.dart';
import 'package:my_flutter_project/data/remote/news_api_impl.dart';
import 'package:my_flutter_project/data/repositories/home_repository/home_repository.dart';
import 'package:my_flutter_project/data/repositories/home_repository/home_repository_impl.dart';
import 'package:my_flutter_project/screens/home_module/controller/home_controller.dart';

class HomeBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<GetStorage>(GetStorage());
    Get.put<NewsApi>(NewsApiImpl());
    Get.put<HomeRepository>(HomeRepositoryImpl(newsApi: Get.find()));
    Get.put(HomeController(homeRepository: Get.find()));
  }
}