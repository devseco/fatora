import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app.dart';
import '../../../core/locale/locale_controller.dart';

class LangSettingsController extends GetxController {
  var selectedLanguage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedLanguage.value = LocaleController.inLang.languageCode;
  }

  void setLanguage(String language) {
    selectedLanguage.value = language;
  }

  void saveSelection() async {
    if (selectedLanguage.value.isNotEmpty) {
      // عرض شاشة الانتظار
      Get.dialog(
        const Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        barrierDismissible: false,
      );

      LocaleController.inLang = Locale(selectedLanguage.value);
      Get.updateLocale(Locale(selectedLanguage.value));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lang', selectedLanguage.value);

      await Future.delayed(const Duration(seconds: 2));
      Get.back();
      restartApp();
    }
  }

  void restartApp() {
    Get.back();
  }
}