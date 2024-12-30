import 'package:cashback/features/settings/controllers/notifications_settings_controller.dart';
import 'package:get/get.dart';

import '../controllers/account_settings_controller.dart';
import '../controllers/lang_settings_controller.dart';

class SettingsBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> LangSettingsController());
    Get.lazyPut(()=> AccountSettingsController());
    Get.lazyPut(()=> NotificationSettingsController());
  }

}