import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashback/features/store/controllers/stores_branches_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../data/models/stores_model.dart';

final StoresBranchesController controller = Get.find();

Widget bodyWidgets() {
  return Column(
    children: [
      categoriesListView(),
      filterIcon(),
      listItems(),
    ],
  );
}
Widget categoriesListView() {
  final categories = ['الكل','قسم 1', 'قسم 2', 'قسم 3', 'قسم 4', 'قسم 5']; // ضع هنا أسماء الأقسام
  return Container(
    height: AppSizes.width * 0.1,
    margin: EdgeInsets.symmetric(vertical: AppSizes.paddingMedium),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSmall),
          child: Chip(
            side: BorderSide.none,
            label: Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontSize: AppSizes.width * 0.035,
              ),
            ),
            backgroundColor: AppColors.greenOff,
          ),
        );
      },
    ),
  );
}
Widget title(){
  return Text(
    '51'.tr,
    style: TextStyle(
      color: AppColors.blueOff,
      fontSize: AppSizes.width * 0.04,
    ),
  );
}

Widget filterIcon() {
  return Padding(
    padding:  EdgeInsetsDirectional.only(
        top: AppSizes.paddingMedium ,
        end: AppSizes.paddingMedium ,
        start: AppSizes.paddingMedium
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        title(),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: PopupMenuButton<String>(
            onSelected: (value) {

            },

            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: 'latest',
                child: Row(
                  children: [
                    const Icon(Icons.schedule, color: Colors.black),
                    const SizedBox(width: 8),
                    Text('36'.tr),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'oldest',
                child: Row(
                  children: [
                    const Icon(Icons.schedule, color: Colors.black),
                    const SizedBox(width: 8),
                    Text('35'.tr),
                  ],
                ),
              ),
            ],
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.filter_list, color: AppColors.greenOff),
                const SizedBox(width: 8),
                Text(
                  '34'.tr,
                  style: TextStyle(
                    color: AppColors.blueOff,
                    fontSize: AppSizes.width * 0.04,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget listItems() {
  return GetX<StoresBranchesController>(
    builder: (controller) {
      if (!controller.isLoading.value) {
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.stores.length,
            itemBuilder: (context, index) {
              return storeListItem(controller.stores[index]);
            },
          ),
        );
      } else {
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: 6,
            itemBuilder: (context, index) {
              return shimmerListItem();
            },
          ),
        );
      }
    },
  );
}

Widget shimmerListItem() {
  //showDialogStore
  return Card(
    color: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    child: ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey,
        ),
      ),
      title: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 20,
          color: Colors.grey.shade300,
        ),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 15,
          margin: const EdgeInsets.only(top: 5),
          color: Colors.grey.shade300,
        ),
      ),
    ),
  );
}



Widget storeListItem(Store store) {
  return GestureDetector(
    onTap: (){
      controller.showDialogStore();
    },
    child: Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CachedNetworkImage(
          imageUrl: store.logoUrl,
          imageBuilder: (context, imageProvider) => CircleAvatar(
            backgroundImage: imageProvider,
            radius: 30,
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            child: Icon(Icons.error),
          ),
        ),
        title: Text(
          store.name,
          style: TextStyle(
            fontSize: AppSizes.width * 0.04,
            fontWeight: FontWeight.bold,
            color: AppColors.blueOff,
          ),
        ),
        subtitle: Text(
          'حتى ${store.discount}',
          style: TextStyle(
            fontSize: AppSizes.width * 0.03,
            color: AppColors.greenOff,
          ),
        ),
      ),
    ),
  );
}