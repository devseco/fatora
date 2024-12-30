import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSettingsController extends GetxController {
  String balance = '2,000';
  final double percentage = 80.0;
  RxMap<String, String> cardData = <String, String>{}.obs; // استخدام RxMap لتحديث البيانات

  @override
  void onInit() {
    super.onInit();
    loadCardFromSharedPreferences(); // تحميل البيانات عند بدء التشغيل
  }

  Future<void> onAddCardPressed() async {
    TextEditingController cardNumberController = TextEditingController();
    Get.dialog(
      AlertDialog(
        title: Text('إضافة بطاقة جديدة'),
        content: TextField(
          controller: cardNumberController,
          decoration: InputDecoration(hintText: 'أدخل رقم البطاقة'),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () async {
              String cardNumber = cardNumberController.text;
              if (cardNumber.isNotEmpty) {
                String cardType = getCardType(cardNumber);
                await saveCardToSharedPreferences(cardNumber, cardType);
                loadCardFromSharedPreferences(); // تحديث البيانات عند إضافة بطاقة
                Get.back(); // إغلاق الـ Dialog بعد الحفظ
              } else {
                Get.snackbar('خطأ', 'يرجى إدخال رقم البطاقة');
              }
            },
            child: Text('حفظ البطاقة'),
          ),
        ],
      ),
    );
  }

  String getCardType(String cardNumber) {
    if (cardNumber.startsWith('4')) {
      return 'Visa';
    } else if (cardNumber.startsWith('5')) {
      return 'MasterCard';
    }
    return 'Unknown';
  }

  Future<void> saveCardToSharedPreferences(String cardNumber, String cardType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('cardNumber', cardNumber);
    await prefs.setString('cardType', cardType);
  }

  Future<void> loadCardFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String cardNumber = prefs.getString('cardNumber') ?? '';
    String cardType = prefs.getString('cardType') ?? '';
    cardData.value = {'cardNumber': cardNumber, 'cardType': cardType}; // تحديث البيانات
  }

  Future<void> removeCardFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('cardNumber');
    await prefs.remove('cardType');
    cardData.value = {}; // تحديث البيانات عند حذف البطاقة
  }
}
