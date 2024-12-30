import 'package:cached_network_image/cached_network_image.dart';
import 'package:cashback/core/utils/app_colors.dart';
import 'package:cashback/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/category_model.dart';

final CategoryController controller = Get.find();

Widget bodyWidgets() {
  return Column(
    children: [
      textTitle(),
      listCategories(),
    ],
  );
}

Widget textTitle(){
  return Align(
    alignment: AlignmentDirectional.centerStart,
    child: Padding(padding: EdgeInsetsDirectional.only(start: AppSizes.width * 0.07),
    child: Text('33'.tr,
      style: TextStyle(
        color: AppColors.blueOff,
        fontSize: AppSizes.width * 0.04
      ),
    ),
    ),
  );
}
Widget listCategories(){
  return Expanded(child: GridView.builder(
    padding: const EdgeInsets.all(20),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
    ),
    itemCount: controller.categories.length,
    itemBuilder: (context, index) {
      return cardCategory(controller.categories[index]);
    },
  ));
}

Widget cardCategory(Category category) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
    child: InkWell(
      onTap: (){
        Get.toNamed('/stores');
      },
      child: Column(
        children: [
          Container(
            height: AppSizes.width * 0.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
                bottom: Radius.circular(10),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: category.imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                      bottom: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppSizes.width * 0.015,
                top: AppSizes.width * 0.02,
              ),
              child: Text(
                category.name,
                style: TextStyle(
                  fontSize: AppSizes.width * 0.025,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blueOff,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}