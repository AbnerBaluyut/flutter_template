import 'package:flutter/material.dart';
import 'package:my_flutter_project/common/app_routes.dart';
import 'package:my_flutter_project/data/models/source/source.dart';
import 'package:my_flutter_project/screens/home_module/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/customs/drawer/custom_drawer.dart';
import 'package:my_flutter_project/customs/snackbar/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final c = Get.find<HomeController>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer.getAppDrawer(_scaffoldKey),
      appBar: AppBar(
        title: const Text("TOP HEADLINES"),
        centerTitle: true,
        actions: [
          Obx(() {
            return PopupMenuButton(
              initialValue: c.initialCountry.value,
              icon: Image.asset("icons/flags/png/${c.selectedCountry}.png", package: "country_icons", height: 40, width: 40),
              onSelected: (String value) => c.selectedCountry = value,
              tooltip: "Select a country",
              itemBuilder: (context) {
                return c.countryList.map((element) {
                  return PopupMenuItem(
                    value: element,
                    child: Row(
                      children: [
                        Image.asset("icons/flags/png/$element.png", package: "country_icons", height: 40, width: 40),
                        const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                        Text(element, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
                      ],
                    ),
                  );
                }).toList();
              },
            );
          })
        ],
      ),
      body: Obx(() {
          return c.isLoading.isTrue ? circularProgress() : Container(
            margin: const EdgeInsets.all(10),
            child: ListView.separated(
              itemBuilder: (context, index) {

                final urlImage = c.articles[index].urlImage;
                final source = c.articles[index].source;
                final description = c.articles[index].description;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                    imageWidget(urlImage ?? "", source),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    Text(c.articles[index].title, style: const TextStyle(fontSize: 17, color: Colors.black), textAlign: TextAlign.left),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                    description == null ? Container() : Text(description, style: const TextStyle(fontSize: 15, color: Colors.grey), textAlign: TextAlign.left),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Website: "),
                        Flexible(
                            child: GestureDetector(
                            onTap: () async {
                              Uri uri = Uri.parse(c.articles[index].url);
                              if (await canLaunchUrl(uri)) launchUrl(uri);
                            },
                            child: Text(c.articles[index].url, style: const TextStyle(decoration: TextDecoration.underline), textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,)
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: c.articles.length
            ),
          );
        }
      ),
    );
  }

  Widget circularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget imageWidget(String urlImage, Source source) {
    return Material(
      child: InkWell(
        onTap: () {
          if (source.id == null) {

            if (!Get.isSnackbarOpen) {
              CustomSnackbar.errorSnackbar("Oops!", "No news detail");
            }
            
          } else {
            Get.toNamed(Routes.detailRoute, arguments: [source.id, source.name]);
          }
        },
        child: Image.network(
          urlImage, 
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Column(
                children: const [
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                  Icon(Icons.error_outline_outlined, size: 50.0, color: Colors.black45),
                  Text("Error loading image", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black45, fontWeight: FontWeight.bold)),
                  Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                ],
              ),
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return circularProgress();
          },
        ),
      ),
    );
  }
}