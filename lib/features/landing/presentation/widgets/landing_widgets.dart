import 'package:cashback/core/utils/app_strings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../controllers/landing_controller.dart';

  final LandingController controller = Get.find();

  AppBar appBar(){
    return AppBar(
      scrolledUnderElevation: 0,
      leadingWidth: AppSizes.width * 0.45,
      title: Text(
          AppStrings.appName,
          style: TextStyle(
              color: AppColors.primary,
              fontSize: AppSizes.fontMedium
          )
      ),
      actions: [
        Padding(
          padding: EdgeInsetsDirectional.only(
          end: AppSizes.paddingMedium
        ),
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.fill,
          )
        )
      ],
      leading: Padding(padding: EdgeInsetsDirectional.only(
          start: AppSizes.paddingMedium),
          child: Row(
          children: [
          cityList(),
          iconsAppBar(Icons.notifications_outlined , ''),
          SizedBox(width: AppSizes.width * 0.03,),
          iconsAppBar(Icons.support_agent_outlined , ''),
      ],
    ),
      ),
      backgroundColor: AppColors.white,
    );
  }

  Widget textTitleWidget(text , color , size ,weight){
    return  Padding(
      padding: EdgeInsetsDirectional.only(start:AppSizes.paddingLarge ,
          end: AppSizes.paddingLarge , top: AppSizes.paddingSmall),
      child: Text('${'2'.tr} $text' , style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),),
    );
  }

Widget bottomNavigationBar() {
  return GetBuilder<LandingController>(builder: (controller) {
    return SizedBox(
      height: AppSizes.width * 0.25,
      child: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.greenOff, // Ensuring color consistency
        ),
        backgroundColor: AppColors.blueOff,
        showUnselectedLabels: true, // Show labels for unselected items
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: AppColors.blueOff,
            icon: SizedBox(
              height: AppSizes.width * 0.08,
              width: AppSizes.width * 0.5,
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                    AppColors.greenOff, BlendMode.srcIn),
                fit: BoxFit.cover,
                "assets/images/home.svg",
              ),
            ),
            label: '3'.tr,
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blueOff,
            icon: SizedBox(
              height: AppSizes.width * 0.08,
              width: AppSizes.width * 0.3,
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(AppColors.greenOff, BlendMode.srcIn),
                fit: BoxFit.cover,
                "assets/images/branches.svg",
              ),
            ),
            label: '4'.tr,
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blueOff,
            icon: SizedBox(
              height: AppSizes.width * 0.08,
              width: AppSizes.width * 0.3,
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(AppColors.greenOff, BlendMode.srcIn),
                fit: BoxFit.cover,
                "assets/images/stores.svg",
              ),
            ),
            label: '5'.tr,
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blueOff,
            icon: SizedBox(
              height: AppSizes.width * 0.08,
              width: AppSizes.width * 0.3,
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(AppColors.greenOff, BlendMode.srcIn),
                fit: BoxFit.cover,
                "assets/images/account.svg",
              ),
            ),
            label: '6'.tr,
          ),
          BottomNavigationBarItem(
            backgroundColor: AppColors.blueOff,
            icon: SizedBox(
              height: AppSizes.width * 0.08,
              width: AppSizes.width * 0.3,
              child: SvgPicture.asset(
                colorFilter: ColorFilter.mode(AppColors.greenOff, BlendMode.srcIn),
                fit: BoxFit.cover,
                "assets/images/categories.svg",
              ),
            ),
            label: '7'.tr,
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        selectedItemColor: AppColors.greenOff,
        unselectedItemColor: AppColors.greenOff,
        onTap: controller.onItemTapped,
      ),
    );
  });
}


Widget cityList(){
    return SizedBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          iconStyleData: IconStyleData(
              iconEnabledColor: AppColors.greenOff
          ),
          hint: Text(
            '12'.tr,
            style: TextStyle(
              color: AppColors.blueOff,
              fontSize: AppSizes.fontSmall,
            ),
          ),
          items: controller.itemsCity
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              textAlign: TextAlign.end,
              style:  TextStyle(
                color: AppColors.blueOff,
                fontSize: AppSizes.fontSmall,
              ),
            ),
          ))
              .toList(),
          value: controller.selectedCity,
          onChanged: (String? value) {

          },
          buttonStyleData:  ButtonStyleData(
            padding:  EdgeInsets.symmetric(horizontal: AppSizes.width * 0.02),
            height: 40,
            width: AppSizes.width * 0.25,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
  Widget iconsAppBar(icon , route){
    return InkWell(
      onTap: (){
        Get.toNamed(route);
      },
      child: Icon(icon),
    );
  }
