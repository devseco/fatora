import 'package:cashback/features/store/controllers/stores_branches_controller.dart';
import 'package:cashback/features/store/controllers/stores_online_controller.dart';
import 'package:get/get.dart';

class StoresBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StoresOnlineController>(() => StoresOnlineController());
    Get.lazyPut<StoresBranchesController>(() => StoresBranchesController());
  }

}