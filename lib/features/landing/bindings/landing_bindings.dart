import 'package:cashback/features/category/controllers/category_controller.dart';
import 'package:cashback/features/home/controllers/home_controller.dart';
import 'package:cashback/features/settings/controllers/settings_controller.dart';
import 'package:cashback/features/store/controllers/stores_branches_controller.dart';
import 'package:cashback/features/store/controllers/stores_online_controller.dart';
import 'package:get/get.dart';
import '../controllers/landing_controller.dart';
class LandingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(() => LandingController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<SettingsController>(() => SettingsController() , fenix: true);
    Get.lazyPut<StoresBranchesController>(() => StoresBranchesController() , fenix: true);
    Get.lazyPut<StoresOnlineController>(() => StoresOnlineController() , fenix: true);

  }
}