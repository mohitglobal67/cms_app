import 'package:cms_news/utils/constant/colors.dart';
import 'package:cms_news/utils/constant/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class drawer extends StatefulWidget {
  const drawer({
    Key? key,
  }) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

// ignore: camel_case_types
class _drawerState extends State<drawer> {
  String? token;

  String? email;

  String? name;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230.w,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.only(
            topRight: const Radius.circular(35),
            bottomRight: Radius.circular(50.r)),
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Mohit Kumar",
                    style: secondTextStyle(
                      AppColors.primaryBlackColor,
                    )),
                accountEmail: Text("Mohit@gmail.com",
                    maxLines: 1,
                    style: secondTextStyle(
                      AppColors.primaryBlackColor,
                    )),
                decoration: const BoxDecoration(
                  color: AppColors.primaryGreyColor,
                  image: DecorationImage(
                    image: NetworkImage(
                      "http://renukatechnologies.in/demo/classic_flutter_news/images/maxresdefault.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ListTile(
                leading: Icon(
                  Icons.school,
                  size: 20.sp,
                  color: AppColors.primaryBlackColor,
                ),
                title: GestureDetector(
                  onTap: () {
                    // Get.back();
                  },
                  child: Text("About Us",
                      textScaler: const TextScaler.linear(1.0),
                      style: secondTextStyle(AppColors.primaryBlackColor)),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.share,
                  size: 20.sp,
                  color: AppColors.primaryBlackColor,
                ),
                title: GestureDetector(
                  onTap: () {
                    // Get.back();
                  },
                  child: Text("Invite Friends",
                      textScaler: const TextScaler.linear(1.0),
                      style: secondTextStyle(AppColors.primaryBlackColor)),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.graphic_eq,
                  size: 20.sp,
                  color: AppColors.primaryBlackColor,
                ),
                title: InkWell(
                  onTap: () {
                    // Get.back();
                  },
                  child: Text("Polls",
                      textScaler: const TextScaler.linear(1.0),
                      style: secondTextStyle(AppColors.primaryBlackColor)),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  size: 20.sp,
                  color: AppColors.primaryBlackColor,
                ),
                title: InkWell(
                  onTap: () {
                    // Get.back();
                  },
                  child: Text("Logout",
                      textScaler: const TextScaler.linear(1.0),
                      style: secondTextStyle(AppColors.primaryBlackColor)),
                ),
              ),
              ListTile(
                title: Text("Version 1.0.11",
                    textScaler: const TextScaler.linear(1.0),
                    style: secondTextStyle(AppColors.primaryBlackColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
