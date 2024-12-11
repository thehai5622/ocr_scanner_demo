import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/TransactionBook/transaction_book_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';

class TransactionBook extends StatelessWidget {
  TransactionBook({super.key});

  final controller = Get.put(TransactionBookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.subMain,
      ),
    );
  }
}