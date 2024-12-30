import 'package:cashback/core/utils/app_colors.dart';
import 'package:cashback/core/utils/app_sizes.dart';
import 'package:cashback/features/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
final SettingsController controller = Get.find();
Widget bodyWidgets() {
  return Column(
    children: [
      listSettings(),
    ],
  );
}

Widget listSettings() {
  return Expanded(
    child: ListView.builder(
      itemCount: controller.settings.length,
      padding: EdgeInsets.only(top: AppSizes.paddingMedium, bottom: AppSizes.paddingMedium),
      itemBuilder: (context, index) {
        String locale = Get.locale?.languageCode ?? 'en';
        return GestureDetector(
          onTap: (){
            Get.toNamed(controller.settings[index].route);
          },
          child: Container(
            margin: EdgeInsetsDirectional.only(
              start: AppSizes.width * 0.03,
              top: AppSizes.width * 0.01,
              end: AppSizes.width * 0.03,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25), // لون الظل مع الشفافية
                  spreadRadius: 1, // مدى انتشار الظل
                  blurRadius: 10, // مدى التمويه في الظل
                  offset: const Offset(-5, 5), // إزاحة الظل نحو اليسار والأسفل
                ),
              ],
              borderRadius: BorderRadius.circular(10), // لتدوير زوايا الـContainer
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // لتوزيع العناصر بالتساوي
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: AppSizes.width * 0.14,
                      width: AppSizes.width * 0.14,
                      child: SvgPicture.asset(
                        fit: BoxFit.cover,
                        controller.settings[index].icon,
                      ),
                    ),
                    SizedBox(width: AppSizes.width * 0.03), // إضافة مسافة بين الأيقونة والنص
                    Text(
                      controller.settings[index].title.tr,
                      style: TextStyle(
                        color: AppColors.blueOff,
                        fontSize: AppSizes.width * 0.035,
                      ),
                    ),
                  ],
                ),
                Icon(
                  locale == 'ar' ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

