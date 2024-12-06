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
      body: Container(
        decoration: const BoxDecoration(
          color: AppColor.subMain,
        ),
        child: SafeArea(
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
      ),
    );
  }
}
