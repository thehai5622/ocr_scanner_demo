import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/Home/home_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.main,
      ),
      child: ElevatedButton(
          onPressed: () {
            controller.pickImageFromGallery();
          },
          child: const Text('Pick Image')),
    );
  }
}
