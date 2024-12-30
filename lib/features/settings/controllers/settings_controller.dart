import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/setting_model.dart';

class SettingsController extends GetxController {
  final List<SettingItem> settings = [
    SettingItem(icon: 'assets/images/account.svg', title: '22', route: '/settings_account' ),
    SettingItem(icon: 'assets/images/iraq.svg', title: '23' ,route: ''),
    SettingItem(icon: 'assets/images/trans.svg', title: '24' , route: '/settings_lang'),
    SettingItem(icon: 'assets/images/notifications.svg', title: '25' , route: '/settings_notifications'),
    SettingItem(icon: 'assets/images/date.svg', title: '26' , route: '/orders'),
    SettingItem(icon: 'assets/images/cut.svg', title: '27' , route: ''),
    SettingItem(icon: 'assets/images/low.svg', title: '28' , route: ''),
    SettingItem(icon: 'assets/images/low.svg', title: '29' , route: ''),
    SettingItem(icon: 'assets/images/quas.svg', title: '30' , route: ''),
    SettingItem(icon: 'assets/images/logout.svg', title: '31' , route: ''),
    SettingItem(icon: 'assets/images/deleteAccount.svg', title: '32' , route: ''),
  ];
}