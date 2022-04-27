import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_project/common/keys.dart';
import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/repositories/home_repository/home_repository.dart';
import 'package:my_flutter_project/customs/drawer/custom_snackbar.dart';

class HomeController extends GetxController {

  GetStorage pref = Get.find();
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

  RxBool isLoading = false.obs;
  late RxList<Article> articles;

  RxString initialCountry = "".obs;
  
  set selectedCountry(String value) {
    initialCountry.value = value;
    pref.write(Keys.country, value);
    loadTopHeadlines();
  }
  String get selectedCountry => pref.read(Keys.country) ?? "us";

  RxList<String> countryList = ["ae", "ar", "at", "au", "be", "bg", "br", "ca", "ch", "cn", "co", "cu", "cz", "de", "eg", "fr", "gb", "gr", "hk", "hu", "id", "ie", "il", "in", "it", "jp", "kr",
  "lt", "lv", "ma", "mx", "my", "ng", "nl", "no", "nz", "ph", "pl", "pt", "ro", "rs", "ru", "sa", "se", "sg", "si", "sk", "th", "tr", "tw", "ua", "us", "ve", "za"].obs;
  
  loadTopHeadlines() async {

    showLoading();

    final result = await homeRepository.getTopHeadlines(selectedCountry, onError: (error) => CustomSnackbar.errorSnackbar("Oops!", error));

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

  @override
  void onInit() {
    super.onInit();

    initialCountry.value = pref.read(Keys.country) ?? "us";

    loadTopHeadlines();
  }
}