import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/Home/home_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';
import 'package:ocr_scanner_demo/Service/device_helper.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.0,
        backgroundColor: AppColor.main,
        elevation: 0,
        title: Column(children: [
          Row(
            children: [
              Obx(
                () => controller.isShowBalance.value
                    ? Row(
                        children: [
                          Text(
                            "0",
                            style: TextStyle(
                              fontSize: DeviceHelper.getFontSize(20),
                              color: AppColor.fourthMain,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            " đ",
                            style: TextStyle(
                              fontSize: DeviceHelper.getFontSize(20),
                              color: AppColor.fourthMain,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        "✱✱✱✱✱✱✱",
                        style: TextStyle(
                          fontSize: DeviceHelper.getFontSize(20),
                          color: AppColor.fourthMain,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changeShowBalance();
                },
                child: Obx(
                  () => Icon(
                          controller.isShowBalance.value
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: AppColor.fourthMain)
                      .marginOnly(left: 12),
                ),
              ),
            ],
          ),
          Tooltip(
              message: "Được tính dựa trên số dư của các ví nắm trong tổng",
              preferBelow: true,
              triggerMode: TooltipTriggerMode.tap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tổng số dư",
                    style: TextStyle(
                      fontSize: DeviceHelper.getFontSize(12),
                      color: AppColor.fourthMain,
                      fontWeight: FontWeight.w400,
                    ),
                  ).marginOnly(right: 4),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: const Icon(
                      Icons.question_mark,
                      color: Colors.white,
                      size: 10,
                    ),
                  )
                ],
              )),
        ]),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_rounded,
              color: AppColor.fourthMain,
            ),
            tooltip: 'Thông báo',
            onPressed: () {
              // Get.toNamed(Routes.notification);
            },
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.subMain,
        ),
        child: ListView(
          children: [
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.fourthMain,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      controller.pickImageFromGallery();
                    },
                    child: const Text('Pick Image'))
                .marginOnly(bottom: 12, top: 12),
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.fourthMain,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      controller.pickImageFromCamera();
                    },
                    child: const Text('Image from Camera'))
                .marginOnly(bottom: 12),
            ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.fourthMain,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(200, 50),
                    ),
                    onPressed: () {
                      controller.clearImage();
                    },
                    child: const Text('Clear Image'))
                .marginOnly(bottom: 12),
            Obx(() {
              if (controller.image.value.path != "") {
                return Image.file(controller.image.value);
              } else {
                return const SizedBox();
              }
            }),
            Obx(() => Text(
                  controller.textInImage.value,
                  style: TextStyle(
                    // decoration: TextDecoration.lineThrough, // Chỉ gạch ngang
                    // decorationColor: AppColor.thirdMain, // Màu gạch ngang
                    // decorationThickness: 2.0, // Độ dày của dòng gạch ngang
                    color: AppColor.thirdMain,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                    fontSize: DeviceHelper.getFontSize(16),
                  ),
                ).paddingAll(20.sp))
          ],
        ),
      ),
    );
  }
}
