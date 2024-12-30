import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashback/core/utils/app_colors.dart';
import 'package:cashback/core/utils/app_sizes.dart';
import 'package:cashback/features/order/controllers/order_controller.dart';
import 'package:cashback/features/order/data/models/store_branch_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

final OrdersController controller = Get.find();

Widget bodyWidgets() {
  return Column(
    children: [
      tabsPages(),
      Expanded(
        child: tabsContent(),
      ),
    ],
  );
}

AppBar appBar() {
  return AppBar(
    iconTheme: IconThemeData(color: AppColors.white),
    title: Text(
      '26'.tr,
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: AppColors.blueOff,
  );
}

Widget tabsPages() {
  return SizedBox(
    height: AppSizes.width * 0.18,
    child: Padding(
      padding: EdgeInsetsDirectional.only(
        top: Get.width * 0.05,
        start: Get.width * 0.05,
        end: Get.width * 0.05,
      ),
      child: TabBar(
        controller: controller.tabController,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: false,
        labelColor: Colors.black,
        unselectedLabelColor: AppColors.blueOff,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blueGrey,
        ),
        labelStyle: TextStyle(
          fontSize: Get.width * 0.021,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Tajawal',
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: Get.width * 0.021,
          fontWeight: FontWeight.bold,
          color: AppColors.blueOff,
          fontFamily: 'Tajawal',
        ),
        tabs: [
          Tab(
            child: Text(
              '49'.tr,
              style: TextStyle(
                color: Colors.black,
                fontSize: AppSizes.fontMedium,
              ),
            ),
          ),
          Tab(
            child: Text(
              '50'.tr,
              style: TextStyle(
                color: AppColors.blueOff,
                fontSize: AppSizes.fontMedium,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget tabsContent() {
  return TabBarView(
    controller: controller.tabController,
    children: [
      listItems(controller.storesBranches, controller.isLoadingBranches),
      listItems(controller.storesOnline, controller.isLoadingOnline),
    ],
  );
}

Widget listItems(list,loading) {
  return GetX<OrdersController>(
    builder: (controller) {
      if (!loading.value) {
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return storeListItem(list[index]);
          },
        );
      } else {
        return ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: 6,
          itemBuilder: (context, index) {
            return shimmerListItem();
          },
        );
      }
    },
  );
}
Widget storeListItem(StoreBranchModel store) {
  return GestureDetector(
    onTap: () {

    },
    child: Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        trailing: Text(
          store.type == 'عرض' ? '53'.tr : '54'.tr,
          style: TextStyle(
            color: AppColors.blueOff,
            fontSize: AppSizes.fontSmall,
            fontWeight: FontWeight.bold,
          ),
        ),
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