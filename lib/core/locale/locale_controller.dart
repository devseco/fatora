import 'dart:ui';
import 'package:cashback/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocaleController extends GetxController {

  static Locale inLang = _getInitialLocale();

  static Locale _getInitialLocale() {

    final savedLang = sharedPreferences.getString('lang');

    if (savedLang != null) {
      return Locale(savedLang);
    } else {
      final deviceLang = window.locale.languageCode;
      return Locale(deviceLang == 'ar' ? 'ar' : 'en');
    }
  }

  void changeLocale() async {
    final prefs = await SharedPreferences.getInstance();
    String currentLang = prefs.getString('lang') ?? 'en';
    String newLang = (currentLang == 'en') ? 'ar' : 'en';
    Locale locale = Locale(newLang);
    await prefs.setString('lang', newLang);
    Get.updateLocale(locale);
  }
}
