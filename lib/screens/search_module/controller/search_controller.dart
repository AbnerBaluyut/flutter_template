
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_project/customs/snackbar/custom_snackbar.dart';
import 'package:my_flutter_project/data/models/article/article.dart';
import 'package:my_flutter_project/data/repositories/search_repository/search_repository.dart';

class SearchController extends GetxController {

  SearchRepository searchRepository;
  SearchController({required this.searchRepository});

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;
  RxList<Article> articles = RxList();

  loadSearchNews() async {
    
    showLoading();

    final result = await searchRepository.searchNews(searchTextController.text, onError: (e) => CustomSnackbar.errorSnackbar("Oops!", e));

    hideLoading();

    if (result != null) {
      articles = result.obs;
    } else {
      articles =  <Article>[].obs;
    }
  }

  @override
  void onInit() {
    super.onInit();

    searchTextController.addListener(() {
      if (searchTextController.text.length%3==0 && searchTextController.text.isNotEmpty) {
        loadSearchNews();
      }
    });
  }

  showLoading() {
    isLoading.toggle();
  }
  hideLoading() {
    isLoading.toggle();
  }
}