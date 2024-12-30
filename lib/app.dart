import 'package:cashback/core/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/routes/route.dart';
import 'config/themes/app_theme.dart';
import 'core/locale/locale_controller.dart';
import 'core/locale/locale_strings.dart';
class CashBack extends StatelessWidget {
  const CashBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: locale(), // تأكد من أن هذه دالة صحيحة وتعيد الترجمات
      locale: LocaleController.inLang,
      title: AppStrings.appName,
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.landingRoute,
      getPages: RouteGenerator.getRoutes(),
      unknownRoute: RouteGenerator.unDefinedRoute(),
    );
  }
}
