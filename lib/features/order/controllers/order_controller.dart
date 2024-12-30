import 'package:cashback/features/order/data/api/stores_branch_repo.dart';
import 'package:cashback/features/order/data/models/store_branch_model.dart';
import 'package:cashback/features/order/data/models/store_online_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController with GetSingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabController;
  var storesOnline = <StoreOnlineModel>[].obs;
  var storesBranches = <StoreBranchModel>[].obs;
  var isLoadingBranches = true.obs;
  var isLoadingOnline = true.obs;

  void fetchStoresBranches(repo, loading) async {
    try {
      loading(true);
      var fetchedStores = await repo.getStores();
      storesBranches.value = fetchedStores;
    } finally {
      loading(false);
    }
    update();
  }

  void setIndex(int value) {
    index = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    fetchStoresBranches(StoresBranchRepository(), isLoadingBranches);
  }


}

