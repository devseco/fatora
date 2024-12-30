import 'package:cashback/core/utils/app_strings.dart';
import 'package:cashback/features/order/bindings/order_bindings.dart';
import 'package:cashback/features/order/presentation/screens/orders_view.dart';
import 'package:cashback/features/settings/bindings/settings_bindings.dart';
import 'package:cashback/features/settings/presentation/screens/account_settings_view.dart';
import 'package:cashback/features/settings/presentation/screens/lang_settings_view.dart';
import 'package:cashback/features/settings/presentation/screens/notifications_settings_view.dart';
import 'package:cashback/features/store/bindings/stores_bindings.dart';
import 'package:cashback/features/store/presentation/screens/stores_online_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/landing/bindings/landing_bindings.dart';
import '../../features/landing/presentation/screens/landing_view.dart';
class Routes {
  static const String landingRoute = "/";
  static const String storesRoute = "/stores";
  static const String ordersRoute = "/orders";
  static const String settingsLangRoute = "/settings_lang";
  static const String settingsAccountRoute = "/settings_account";
  static const String settingsNotificationsRoute = "/settings_notifications";
}

class RouteGenerator {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
          name: Routes.landingRoute,
          page: () => const LandingView(),
          binding: LandingBindings()
      ),
      GetPage(
          name: Routes.storesRoute,
          page: () => const StoresOnlineView(),
          binding: StoresBindings()
      ),
      GetPage(
          name: Routes.ordersRoute,
          page: () => const OrdersView(),
          binding: OrdersBindings()
      ),
      GetPage(
          name: Routes.settingsLangRoute,
          page: () => const LangSettingsView(),
          binding: SettingsBindings()
      ),
      GetPage(
          name: Routes.settingsAccountRoute,
          page: () => const AccountSettingsView(),
          binding: SettingsBindings()
      ),
      GetPage(
          name: Routes.settingsNotificationsRoute,
          page: () => const NotificationsSettingsView(),
          binding: SettingsBindings()
      ),

    ];
  }
  static GetPage unDefinedRoute() {
    return GetPage(
      name: '/not-found',
      page: () => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noFountRoute),
        ),
        body: Center(
          child: Text(AppStrings.noFountRoute),
        ),
      ),
    );
  }
}
