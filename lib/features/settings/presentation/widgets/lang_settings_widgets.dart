import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cashback/core/utils/app_sizes.dart';
import 'package:cashback/features/settings/controllers/lang_settings_controller.dart';
import '../../../../core/utils/app_colors.dart';

final LangSettingsController controller = Get.find();

Widget bodyWidgets() {
  return Column(
    children: [
      listLangs(),
      buttonSave(),
    ],
  );
}

AppBar appBar() {
  return AppBar(
    iconTheme: IconThemeData(
        color: AppColors.white
    ),
    title: Text(
      '24'.tr,
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.blueOff,
  );
}

Widget listLangs() {
  return SizedBox(
    height: AppSizes.width * 0.8,
    child: ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        buildLanguageOption('ar', 'العربية', controller),
        buildLanguageOption('ku', 'الكردية', controller),
        buildLanguageOption('en', 'English', controller),
      ],
    ),
  );
}

Widget buildLanguageOption(String langCode, String language, LangSettingsController controller) {
  return GestureDetector(
    onTap: () {
      controller.setLanguage(langCode);
    },
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(-5, 5),
          ),
        ],
      ),
      child: Obx(() {
        bool isSelected = controller.selectedLanguage.value == langCode;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.blueOff,
              ),
            ),
            Transform.scale(
              scale: 1.5, // تكبير الحجم
              child: Checkbox(
                value: isSelected,
                onChanged: (bool? isChecked) {
                  if (isChecked != null && isChecked) {
                    controller.setLanguage(langCode);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // دائري
                ),
                checkColor: Colors.white, // لون علامة الصح
                activeColor: Colors.teal, // لون الدائرة عند التحديد
              ),
            ),
          ],
        );
      }),
    ),
  );
}

Widget buttonSave() {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.greenOff, // لون الخلفية
          padding: EdgeInsets.symmetric(vertical: 16.0), // زيادة ارتفاع الزر
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // تدوير زوايا الزر
          ),
        ),
        onPressed: () {
          controller.saveSelection();
        },
        child: Text(
          'حفظ',
          style: TextStyle(
              fontSize: AppSizes.fontMedium, // حجم الخط
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    ),
  );
}
