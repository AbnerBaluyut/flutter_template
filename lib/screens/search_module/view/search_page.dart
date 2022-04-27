import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/common/app_routes.dart';
import 'package:my_flutter_project/data/models/source/source.dart';
import 'package:my_flutter_project/screens/search_module/controller/search_controller.dart';
import 'package:my_flutter_project/customs/snackbar/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final c = Get.find<SearchController>();
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer.getAppDrawer(_scaffoldKey),
      appBar: AppBar(
        title: const Text("Search News"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: c.searchTextController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_rounded)
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return c.isLoading.isTrue ? circularProgress() : c.articles.isEmpty ? const Center(child: Text("No news found")) : Container(
                padding: const EdgeInsets.all(10),
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

            })
          )
        ],
      )
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
              
              Get.snackbar(
                "Oops!", 
                "No news detail", 
                icon: const Icon(Icons.error, color: Colors.white),
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM, 
                backgroundColor: Colors.redAccent, 
                duration: const Duration(seconds: 4),
                isDismissible: true,
                borderRadius: 20,
                margin: const EdgeInsets.all(15),
                dismissDirection: DismissDirection.horizontal,
                forwardAnimationCurve: Curves.easeOutBack,
              );
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