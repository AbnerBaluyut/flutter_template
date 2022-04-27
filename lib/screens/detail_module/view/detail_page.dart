import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/screens/detail_module/controller/detail_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends GetView<DetailController> {

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.name.value)),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Obx(() {
          return controller.isLoading.isTrue ? circularProgress() : Container(
            margin: const EdgeInsets.all(10),
            child: ListView.separated(
              itemBuilder: (context, index) {

                final urlImage = controller.articles[index].urlImage;
                final description = controller.articles[index].description;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                    urlImage == null ? Container() : imageWidget(urlImage),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                    Text(controller.articles[index].title, style: const TextStyle(fontSize: 17, color: Colors.black), textAlign: TextAlign.left),
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
                              Uri uri = Uri.parse(controller.articles[index].url);
                              if (await canLaunchUrl(uri)) launchUrl(uri);
                            },
                            child: Text(controller.articles[index].url, style: const TextStyle(decoration: TextDecoration.underline), textAlign: TextAlign.left, overflow: TextOverflow.ellipsis,)
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: controller.articles.length
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

  Widget imageWidget(String urlImage) {
    return Image.network(
      urlImage, 
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return circularProgress();
      },
    );
  }
}
