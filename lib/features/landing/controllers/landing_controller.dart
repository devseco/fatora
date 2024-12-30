
import 'package:cashback/features/category/presentation/screens/category_view.dart';
import 'package:cashback/features/order/presentation/screens/orders_view.dart';
import 'package:cashback/features/settings/presentation/screens/settings_view.dart';
import 'package:cashback/features/store/presentation/screens/store_branches_view.dart';
import 'package:cashback/features/store/presentation/screens/stores_online_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/presentation/screens/home_view.dart';

class LandingController extends GetxController {
  RxInt selectedIndex = 0.obs;
   List<Widget> pagesLanding = <Widget>[
       const HomeView(),
       const StoreBranchesView(),
       const StoresOnlineView(),
       const SettingsView(),
       const SettingsView(),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
    update();
  }
  final List<String> itemsCity = [
    'بغداد',
    'البصرة',
    'بابل',
    'اربيل',
  ];
  String? selectedCity;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


}