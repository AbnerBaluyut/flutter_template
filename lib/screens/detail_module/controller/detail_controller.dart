import 'package:get/get.dart';
import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/repositories/detail_repository/detail_repository.dart';
import 'package:my_flutter_project/customs/drawer/custom_snackbar.dart';

class DetailController extends GetxController {

  DetailRepository detailRepository;
  DetailController({required this.detailRepository});

  var arguments = Get.arguments;

  late RxString id;
  late RxString name;
  
  @override
  void onInit() {
    super.onInit();

    id = (arguments[0] as String).obs;
    name = (arguments[1] as String).obs;

    loadNewsById();
  }

   RxBool isLoading = false.obs;
  late RxList<Article> articles;
  
  loadNewsById() async {

    showLoading();

    final result = await detailRepository.getNewsById(id.value, onError: (e) => CustomSnackbar.errorSnackbar("Oops!", e));

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      articles =  <Article>[].obs;
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}