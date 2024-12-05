import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/PickImage/pick_image_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';

class PickImage extends StatelessWidget {
  PickImage({super.key});

  final controller = Get.put(PickImageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.main,
      ),
      child: SafeArea(
        child: Column(
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
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
