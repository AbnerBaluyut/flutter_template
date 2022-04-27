
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {

  static errorSnackbar(String title, String message) {
    if (!Get.isSnackbarOpen) {
      return Get.snackbar(
        title, 
        message, 
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
  }
}