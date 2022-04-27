import 'package:my_flutter_project/screens/detail_module/binding/detail_binding.dart';
import 'package:my_flutter_project/screens/home_module/binding/home_binding.dart';
import 'package:my_flutter_project/common/app_routes.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/screens/detail_module/view/detail_page.dart';
import 'package:my_flutter_project/screens/home_module/view/home_page.dart';
import 'package:my_flutter_project/screens/search_module/binding/search_binding.dart';
import 'package:my_flutter_project/screens/search_module/view/search_page.dart';

class AppPages {

  static const inital = Routes.homeRoute;

  static final routes = [
    GetPage(name: Routes.homeRoute, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.detailRoute, page: () => DetailPage(), binding: DetailBinding()),
    GetPage(name: Routes.searchRoute, page: () => SearchPage(), binding: SearchBinding()),
  ];
}