import 'package:cashback/core/utils/app_sizes.dart';
import 'package:cashback/features/settings/controllers/account_settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';

final AccountSettingsController controller = Get.find();

AppBar appBar() {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.white),
    title: Text(
      '22'.tr,
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.blueOff,
  );
}

Widget bodyWidgets() {
  return ListView(
    children: [
      nameAndEmail(),
      circelCompleted(),
      itemEdit('Ali Mohammed', true, 'الاسم'),
      itemEdit('quest@gmail.com', false, ''),
      itemEdit('ذكر', true, ''),
      itemEdit('1997-12-21', true, ''),
      itemEdit('07712710192', true, ''),
      cardWidget(),
    ],
  );
}

Widget nameAndEmail() {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top: AppSizes.width * 0.1),
      child: Column(
        children: [
          Text(
            'Ali Mohammed',
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.fontLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Guest@gmail.com',
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.fontMedium,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: AppSizes.width / 1.2,
            child: Divider(
              color: AppColors.greenOff,
            ),
          ),
          Text(
            '${'37'.tr} ${controller.balance} IQD',
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.width * 0.035,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget circelCompleted() {
  return Row(
    children: [
      Container(
        margin: EdgeInsetsDirectional.only(
          top: AppSizes.paddingMedium,
          start: AppSizes.paddingMedium,
        ),
        width: AppSizes.width * 0.2,
        height: AppSizes.width * 0.2,
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: AppSizes.width * 0.2,
                height: AppSizes.width * 0.2,
                child: CircularProgressIndicator(
                  value: controller.percentage / 100,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  color: AppColors.greenOff,
                ),
              ),
            ),
            Center(
              child: Text(
                '${controller.percentage.toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: AppSizes.paddingSmall),
      SizedBox(
        width: AppSizes.width * 0.65,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                '${'38'.tr} ${controller.percentage.toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: AppSizes.width * 0.03),
            LinearProgressIndicator(
              value: controller.percentage / 100,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              color: AppColors.greenOff,
            ),
          ],
        ),
      )
    ],
  );
}
Widget cardWidget() {
  return Obx(() {
    final cardNumber = controller.cardData['cardNumber'] ?? '';
    final cardType = controller.cardData['cardType'] ?? '';

    // دالة لتنسيق رقم البطاقة
    String formatCardNumber(String cardNumber) {
      if (cardNumber.length >= 8) {
        final firstPart = cardNumber.substring(0, 4);
        final lastPart = cardNumber.substring(cardNumber.length - 4);
        return '$firstPart XXXX XXXX $lastPart';
      }
      return cardNumber;
    }

    if (cardNumber.isNotEmpty) {
      return Container(
        margin: EdgeInsetsDirectional.only(
          start: AppSizes.width * 0.1,
          end: AppSizes.paddingMedium
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              formatCardNumber(cardNumber),
              style: TextStyle(
                color: AppColors.blueOff,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.width * 0.04,
              ),
            ),
            Image.asset(
              cardType == 'MasterCard'
                  ? 'assets/images/master.png'
                  : 'assets/images/visa.png',
              width: AppSizes.width * 0.1,
            ),
            IconButton(
              icon: SizedBox(
                width: AppSizes.width * 0.2,
                height: AppSizes.width * 0.2,
                child:  Icon(Icons.remove_circle,color: AppColors.red),
              ),
              onPressed: () async => await controller.removeCardFromSharedPreferences(),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsetsDirectional.only(
          start: AppSizes.width * 0.1,
          end: AppSizes.paddingMedium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'بطاقتي',
              style: TextStyle(
                color: AppColors.blueOff,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.width * 0.04,
              ),
            ),
            IconButton(
              icon: SizedBox(
                width: AppSizes.width * 0.2,
                height: AppSizes.width * 0.2,
                child:  Icon(Icons.add , color: AppColors.greenOff,),
              ),
              onPressed: () => controller.onAddCardPressed(),
            ),
          ],
        ),
      );
    }
  });
}



Widget itemEdit(String value, bool isEdit, String title, [Function? onAddPressed]) {
  return Container(
    margin: EdgeInsetsDirectional.only(
      start: AppSizes.width * 0.1,
      end: AppSizes.paddingMedium,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value.isEmpty ? title : value,
          style: TextStyle(
            color: AppColors.blueOff,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.width * 0.04,
          ),
        ),
        isEdit
            ? IconButton(
          icon: value.isEmpty
              ? Icon(Icons.add)
              : Image.asset(
            'assets/images/edit.png',
            width: AppSizes.width * 0.2,
            height: AppSizes.width * 0.2,
            fit: BoxFit.cover,
          ),
          onPressed: () => onAddPressed?.call(),
        )
            : SizedBox(),
      ],
    ),
  );
}
