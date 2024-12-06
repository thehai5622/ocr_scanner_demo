import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/dashboard_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';
import 'package:ocr_scanner_demo/View/Home/home.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.fourthMain,
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: () {
          // Xử lý nút thêm nào đó
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Obx(() {
        switch (controller.currentIndex.value) {
          case 0:
            return Home();
          case 1:
            return Container();
          case 2:
            return Container();
          case 3:
            return Container();
          default:
            return Container();
        }
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        height: 72.h,
        color: AppColor.main,
        shape: const CircularNotchedRectangle(),
        child: Obx(
          () => Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Trang Tổng quan
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(0),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/home_hashtag.svg',
                            colorFilter: controller.currentIndex.value == 0
                                ? const ColorFilter.mode(
                                    AppColor.fourthMain, BlendMode.srcIn)
                                : null,
                          ),
                          Text(
                            'Tổng quan',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: controller.currentIndex.value == 0
                                  ? AppColor.fourthMain
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Trang nào đó
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(1),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // SvgPicture.asset(
                          //   'assets/icons/home_hashtag.svg',
                          //   colorFilter: controller.currentIndex.value == 1
                          //       ? const ColorFilter.mode(
                          //           AppColor.fourthMain, BlendMode.srcIn)
                          //       : null,
                          // ),
                          Icon(
                            Icons.ac_unit_rounded,
                            color: controller.currentIndex.value == 1
                                ? AppColor.fourthMain
                                : Colors.grey,
                          ),
                          Text(
                            'Some page 1',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: controller.currentIndex.value == 1
                                  ? AppColor.fourthMain
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Trang nào đó
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(2),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // SvgPicture.asset(
                          //   'assets/icons/home_hashtag.svg',
                          //   colorFilter: controller.currentIndex.value == 2
                          //       ? const ColorFilter.mode(
                          //           AppColor.fourthMain, BlendMode.srcIn)
                          //       : null,
                          // ),
                          Icon(
                            Icons.person,
                            color: controller.currentIndex.value == 2
                                ? AppColor.fourthMain
                                : Colors.grey,
                          ),
                          Text(
                            'Some page 2',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: controller.currentIndex.value == 2
                                  ? AppColor.fourthMain
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Trang Cá nhân
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.changePage(3),
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/user_octagon.svg',
                            colorFilter: controller.currentIndex.value == 3
                                ? const ColorFilter.mode(
                                    AppColor.fourthMain, BlendMode.srcIn)
                                : null,
                          ),
                          Text(
                            'Cá nhân',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: controller.currentIndex.value == 3
                                  ? AppColor.fourthMain
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
