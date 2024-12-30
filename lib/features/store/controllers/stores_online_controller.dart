import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/app_widgets.dart';
import '../data/api/stores_repositroy.dart';
import '../data/models/stores_model.dart';

class StoresOnlineController extends GetxController {
  var stores = <Store>[].obs;
  var isLoading = true.obs;
  final String storeName = "اسم المتجر";
  final String storeInfo = "بعض المعلومات عن المتجر";
  int shoppingNumber = 203;

  @override
  void onInit() {
    super.onInit();
    fetchStores();
  }

  void fetchStores() async {
    try {
      isLoading(true);
      var fetchedStores = await StoreRepository().getStores();
      stores.value = fetchedStores;
        } finally {
      isLoading(false);
    }
    update();
  }
  Future showDialogStore(){
    return Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: dialogInfoStore(this),
      ),
    );
  }
}
