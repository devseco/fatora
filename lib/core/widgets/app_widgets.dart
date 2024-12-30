import 'package:cashback/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/app_colors.dart';

Widget dialogInfoStore(controller){
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Get.back();
                },
              ),
              Text(
                controller.storeName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blueOff
                ),
              ),
              // Spacer لترك المساحة الفارغة بجانب اسم المتجر
              const SizedBox(width: 48), // نفس حجم IconButton لإبقاء الاسم في المنتصف
            ],
          ),
        ),
        SizedBox(height: AppSizes.width * 0.05),
        Text(
          '41'.tr,
          textAlign: TextAlign.center,
          style:  TextStyle(fontSize: 18,
              color: AppColors.red

          ),
        ),
        SizedBox(height: AppSizes.width * 0.03),
        Text(
          '${'42'.tr} #${controller.shoppingNumber} ${'43'.tr}',
          textAlign: TextAlign.center,
          style:  TextStyle(
            fontSize: AppSizes.fontSmall,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        SizedBox(height: AppSizes.width * 0.03),
        Container(
          width: AppSizes.width * 0.4,
          height: AppSizes.width * 0.4,
          decoration:  BoxDecoration(
            color: AppColors.greenOff,
            shape: BoxShape.circle,
          ),
          child:  Center(
            child: Text(
              'حتى 40%',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSizes.fontMedium,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: AppSizes.width * 0.04),
        Text(
          '44'.tr,
          textAlign: TextAlign.center,
          style:  TextStyle(
              fontSize: AppSizes.width * 0.05,
              color: AppColors.blueOff
          ),
        ),
        SizedBox(height: AppSizes.width * 0.06),
        Text(
          '48'.tr,
          textAlign: TextAlign.center,
          style:  TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: AppSizes.width * 0.03,
              color: AppColors.blueOff
          ),
        ),
        SizedBox(height: AppSizes.width * 0.06),
        SizedBox(
          height: AppSizes.width * 0.3,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildCashbackRow('كاش باك حسب الفئة 1', '7.5% كاش باك'),
              _buildCashbackRow('كاش باك حسب الفئة 2', '10% كاش باك'),
              _buildCashbackRow('كاش باك حسب الفئة 3', '5% كاش باك'),
            ],
          ),
        ),
        SizedBox(height: AppSizes.width * 0.06),
        GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: AppSizes.width * 0.7,
            height: AppSizes.width * 0.12,
            color: AppColors.greenOff,
            child: Center(
              child: Text('47'.tr,
                style: TextStyle(
                    fontSize: AppSizes.width * 0.04,
                    fontWeight: FontWeight.bold
                ),

              ),
            ),
          ),
        )

      ],
    ),
  );
}
Widget _buildCashbackRow(String category, String cashback) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 16, // يمكنك استخدام AppSizes.width * 0.03 هنا
            fontWeight: FontWeight.w400,
            color: Colors.blue, // يمكنك استخدام AppColors.blueOff هنا
          ),
        ),
        Text(
          cashback,
          style: TextStyle(
            fontSize: 16, // يمكنك استخدام AppSizes.width * 0.03 هنا
            color: Colors.red,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}