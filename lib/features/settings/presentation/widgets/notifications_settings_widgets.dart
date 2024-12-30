import 'package:cashback/core/utils/app_sizes.dart';
import 'package:cashback/features/settings/controllers/notifications_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';

final NotificationSettingsController controller = Get.find();
Widget bodyWidgets() {
  return Column(
    children: [
      switchNotifications(),
    ],
  );
}
AppBar appBar() {
  return AppBar(
    iconTheme: IconThemeData(
        color: AppColors.white
    ),
    title: Text(
      '39'.tr,
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.blueOff,
  );
}


Widget switchNotifications(){
  return Container(
    margin: EdgeInsets.only(
      top: AppSizes.paddingMedium,
      left: AppSizes.paddingMedium,
      right: AppSizes.paddingMedium,
    ),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.40),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(-5, 5),
        ),
      ],
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '40'.tr,
          style:  TextStyle(fontSize: 20,
              color: AppColors.bgNav

          ),
        ),
        Obx(
              () => Switch(
                activeColor: AppColors.greenOff,
             activeTrackColor: AppColors.blueOff,
            value: controller.isSwitched.value,
            onChanged: (value) {
              controller.toggleSwitch(value);
            },
          ),
        ),
      ],
    ),
  );
}
