import 'package:get/get.dart';
import 'package:my_flutter_project/data/repositories/detail_repository/detail_repository.dart';
import 'package:my_flutter_project/data/repositories/detail_repository/detail_repository_impl.dart';
import 'package:my_flutter_project/screens/detail_module/controller/detail_controller.dart';

class DetailBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<DetailRepository>(DetailRepositoryImpl(newsApi: Get.find()));
    Get.put(DetailController(detailRepository: Get.find()));
  }
}