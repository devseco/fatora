import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cashback/core/utils/app_colors.dart';
import 'package:cashback/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:textfield_search/textfield_search.dart';
import '../../controllers/home_controller.dart';

final HomeController controller = Get.find();

Widget bodyWidgets() {
  return ListView(
    children: [
      searchTextInput(),
      listFavorites(),
      sliderImages(),
      titleSteps(),
      stepsIcons(),
      discountLabel('19'.tr, 'bestOnline'),
      discountItems(controller.recentlyList),
      discountLabel('20'.tr, 'bestOnline'),
      discountItems(controller.recentlyList),
    ],
  );
}

Padding searchTextInput() {
  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: AppSizes.height * 0.02,
      end: AppSizes.height * 0.02,
      top: AppSizes.height * 0.015,
    ),
    child: SizedBox(
      width: AppSizes.width * 0.9,
      height: AppSizes.height * 0.05,
      child: GetBuilder<HomeController>(
        builder: (c) {
          return TextFieldSearch(
            label: 'My Label',
            controller: c.searchController,
            future: () {
              return c.fetchDataSearch();
            },
            getSelectedValue: (value) {
              if (value != null) {
                //TestItem selectedItem = value as TestItem;
              }
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: '13'.tr,
              hintStyle: TextStyle(
                fontSize: Get.height * 0.015,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                borderSide: BorderSide(
                  color: AppColors.greenOff,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greenOff,
                ),
              ),
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: AppColors.greenOff,
                ),
                child: Icon(Icons.search,
                    color: AppColors.blueOff, size: Get.height * 0.03),
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget listFavorites() {
  return Padding(
    padding: EdgeInsets.all(AppSizes.paddingASmall),
    child: Container(
      margin: EdgeInsetsDirectional.only(
          top: AppSizes.paddingMedium, start: AppSizes.paddingMedium),
      height: AppSizes.width * 0.18,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.stores.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStoreButton();
          } else {
            return _buildStoreItem(controller.stores[index - 1]);
          }
        },
      ),
    ),
  );
}

Widget _buildAddStoreButton() {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          // ضع هنا وظيفة إضافة متجر جديد
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: AppSizes.width * 0.09, // زيادة حجم الـContainer
          height: AppSizes.width * 0.09, // زيادة حجم الـContainer
          decoration: BoxDecoration(
            color: AppColors.blueOff,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
      SizedBox(height: AppSizes.width * 0.02),
      Text(
        '14'.tr,
        style: TextStyle(
          color: AppColors.blueOff,
          fontSize: AppSizes.width * 0.02,
        ),
      ),
    ],
  );
}

Widget _buildStoreItem(String storeName) {
  return Container(
    margin: const EdgeInsets.symmetric(
      horizontal: 5,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: AppSizes.width * 0.09,
          height: AppSizes.width * 0.09,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              storeName[0],
              style:
                  TextStyle(fontSize: AppSizes.fontMedium, color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: AppSizes.width * 0.02),
        SizedBox(
          width: AppSizes.width * 0.14,
          child: Text(
            storeName,
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.width * 0.02,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

Widget sliderImages() {
  return Container(
    height: AppSizes.width * 0.3,
    width: AppSizes.width,
    margin: EdgeInsets.only(
      right: AppSizes.paddingMedium,
      left: AppSizes.paddingMedium,
    ),
    child: CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: controller.imgList.map((item) {
        return SizedBox(
          height: AppSizes.width * 0.4,
          width: AppSizes.width,
          child: Center(
            child: CachedNetworkImage(
              imageUrl: item,
              fit: BoxFit.fill,
              width: AppSizes.width,
              height: AppSizes.width,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                  width: AppSizes.width,
                  height: AppSizes.width,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget stepsIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          const CircleAvatar(
            radius: 15, // Adjust the size as needed
            backgroundColor: Colors.blue, // Background color of the circle
            child: Icon(Icons.shopping_cart,
                color: Colors.white), // Icon inside the circle
          ),
          const SizedBox(height: 8), // Space between the icon and the text
          Text(
            "15".tr,
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.fontSubSmall,
            ),
          ),
        ],
      ),
      Container(
        width: 100, // Width of the line
        height: 2, // Thickness of the line
        color: AppColors.blueOff, // Color of the line
      ),
      Column(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.green,
            child: Icon(Icons.monetization_on, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "16".tr,
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.fontSubSmall,
            ),
          ),
        ],
      ),
      Container(
        width: 100,
        height: 2,
        color: AppColors.blueOff,
      ),
      Column(
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.red,
            child: Icon(Icons.money, color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            "17".tr,
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.fontSubSmall,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget titleSteps() {
  return Padding(
    padding: EdgeInsets.only(
        top: AppSizes.paddingMedium, bottom: AppSizes.paddingMedium),
    child: Center(
      child: Text(
        "18".tr,
        style: TextStyle(
          color: AppColors.blueOff,
          fontSize: AppSizes.fontSubSmall,
        ),
      ),
    ),
  );
}

Widget discountLabel(title, page) {
  return Padding(
    padding: EdgeInsetsDirectional.only(
        start: Get.height * 0.02,
        end: Get.height * 0.02,
        top: AppSizes.paddingLarge),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: Get.height * 0.005,
              height: Get.height * 0.02,
              color: AppColors.greenOff,
            ),
            SizedBox(
              width: Get.height * 0.01,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: Get.height * 0.02,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueOff),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed('$page');
          },
          child: Row(
            children: [
              Text(
                "90".tr,
                style: TextStyle(
                    fontSize: Get.height * 0.016, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: Get.height * 0.007,
              ),
              Icon(
                Icons.arrow_circle_left_outlined,
                color: AppColors.blueOff,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget listStores() {
  return GetBuilder<HomeController>(builder: (builder) {
    if (!builder.isLoadingRecently.value) {
      if (builder.recentlyList.isNotEmpty) {
        return discountItems(builder.recentlyList);
      } else {
        return Center(
          child: Text('20'.tr),
        );
      }
    } else {
      return Center(
        child: SpinKitWave(
          color: AppColors.blueOff,
          size: Get.width * 0.1,
        ),
      );
    }
  });
}

Widget discountItems(list) {
  return SizedBox(
    height: Get.height * 0.15,
    child: ListView.builder(
      padding: EdgeInsetsDirectional.only(top: AppSizes.paddingMedium),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: (list.length > 6) ? 6 : list.length,
      itemBuilder: (context, index) {
        var item = list[index];
        return discountItem(
            item.image, item.storeLable, item.storeId, item.discountValue);
      },
    ),
  );
}


Widget discountItem(String url, String label, int id, int discount) {
  return GestureDetector(
    onTap: () {
      controller.showDialogStore();
    },
    child: Padding(
      padding: EdgeInsetsDirectional.only(
          start: Get.height * 0.01, end: Get.height * 0.01),
      child: Column(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: Get.height * 0.08,
            width: Get.height * 0.08,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45.0),
              child: CachedNetworkImage(
                imageUrl: url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.003,
          ),
          SizedBox(
            width: Get.width * 0.24,
            child: Text(label,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.blueOff,
                    fontSize: Get.height * 0.015)),
          ),
          SizedBox(
            height: Get.height * 0.003,
          ),
          Row(
            children: [
              Text(
                'كاش باك ',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.blueOff, fontSize: AppSizes.fontSubSmall),
              ),
              Text(
                '$discount%',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.blueOff,
                    fontWeight: FontWeight.bold,
                    fontSize: Get.height * 0.018),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
