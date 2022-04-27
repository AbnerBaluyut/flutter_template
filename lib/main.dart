import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_flutter_project/common/app_pages.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Demo!!!",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      themeMode: ThemeMode.dark,
      defaultTransition: Transition.native,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.inital,
    );
  }
}
