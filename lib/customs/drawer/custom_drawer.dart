import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/common/app_routes.dart';

class CustomDrawer {

  static closeDrawer(GlobalKey<ScaffoldState> key) => key.currentState?.openEndDrawer();

  static getAppDrawer(GlobalKey<ScaffoldState> key) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.lightBlue,
            ),
            child: Center(
              child: Text("Menu", style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ),
          ListTile(
            title: const Text("Top Headline"),
            onTap: () {
              if (Get.currentRoute != Routes.homeRoute) Get.offNamed(Routes.homeRoute);
              closeDrawer(key);
            },
            leading: const Icon(Icons.newspaper)
          ),
          ListTile(
            title: const Text("Search News"),
            onTap: () {
              if (Get.currentRoute != Routes.searchRoute) Get.offNamed(Routes.searchRoute);
              closeDrawer(key);
            },
            leading: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}