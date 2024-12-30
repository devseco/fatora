import 'package:cashback/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/app_widgets.dart';
import '../../landing/data/models/discount_model.dart';
import '../../landing/data/models/sliderBar_model.dart';
import '../presentation/widgets/home_widgets.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var isLoadingRecently = true.obs;
  var isLoadingHighest = true.obs;
  var isLoadingSliders = true.obs;
  var recentlyList = <Discount>[].obs;
  var highestList = <Discount>[].obs;
  var slidersList = <SliderBar>[].obs;
  int shoppingNumber = 203;
  final String storeName = "اسم المتجر";
  final String storeInfo = "بعض المعلومات عن المتجر";

  final List<String> stores = [
    'متجر مندي صنعاء',
    'متجر بابل للصناعات',
    'مطعم سوبر جكن',
    'مطعم خان مندي',
    'مطعم بيت المندي',
    'اسواق هايبر ماركت'
  ];

  final List<String> imgList = [
    'https://static.vecteezy.com/system/resources/previews/042/672/834/non_2x/special-offer-flash-sale-mega-offer-in-green-colour-theme-limited-time-offer-best-banner-design-for-social-media-and-corporate-companies-eps-file-vector.jpg',
    'https://as1.ftcdn.net/v2/jpg/03/20/50/34/1000_F_320503493_l9NxQfyis51ZZdgP5AhqqP8WOvew2vbd.jpg',
    'https://static.vecteezy.com/system/resources/previews/038/049/181/non_2x/organic-food-horizontal-banner-template-design-vector.jpg'
  ];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() {
    isLoadingHighest(true);
    isLoadingRecently(true);
    isLoadingSliders(true);
    // إضافة بيانات تجريبية لقوائم recentlyList
    recentlyList.addAll([
      Discount(title: 'خصم 20% على متجر مندي صنعاء', discountValue: 1 , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' , storeId: 1 , storeLable: 'تجريبي'),
      Discount(title: 'خصم 15% على متجر بابل للصناعات', discountValue: 20 , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' , storeId:  1 , storeLable:  'متجر تجريبي'),
      Discount(title: 'خصم 30% على مطعم سوبر جكن', discountValue: 4 , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' ,storeId: 1 , storeLable:  'تجريبي'),
      Discount(title: 'خصم 20% على متجر مندي صنعاء', discountValue: 1 , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' , storeId: 1 , storeLable: 'تجريبي'),
      Discount(title: 'خصم 15% على متجر بابل للصناعات', discountValue: 20 , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' , storeId:  1 , storeLable:  'متجر تجريبي'),
      Discount(title: 'خصم 30% على مطعم سوبر جكن', discountValue: 4 , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' ,storeId: 1 , storeLable:  'تجريبي'),

    ]);

    // إضافة بيانات تجريبية لقوائم highestList
    highestList.addAll([
      Discount(title: 'خصم 50% على مطعم خان مندي', discountValue: 2  , image:  'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg' , storeId: 1 , storeLable: 'متجر تجريبي جديد'),
      Discount(title: 'خصم 40% على مطعم بيت المندي', discountValue: 9 , image: 'https://img.freepik.com/premium-vector/logo-fast-food-restaurant-company-brand-business-marketing_686210-21.jpg',storeId: 1 , storeLable: 'متجر مطعم جديد'),
    ]);

    // إضافة بيانات تجريبية لقوائم slidersList
    slidersList.addAll([
      SliderBar(
          imageUrl: imgList[0], description: 'عرض خاص لمتجر مندي صنعاء'),
      SliderBar(
          imageUrl: imgList[1], description: 'عرض مميز لمطعم سوبر جكن'),
    ]);

    // تغيير حالة التحميل
    isLoadingRecently.value = false;
    isLoadingHighest.value = false;
    isLoadingSliders.value = false;
  }
  void fetchDataSearch(){

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