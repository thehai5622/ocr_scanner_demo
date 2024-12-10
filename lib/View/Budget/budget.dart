import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/Budget/budget_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';

class Budget extends StatelessWidget {
  Budget({super.key});

  final controller = Get.put(BudgetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.thirdMain,
      ),
    );
  }
}