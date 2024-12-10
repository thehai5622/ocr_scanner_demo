import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Controller/Individual/RequestSupport/request_support_controller.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';
import 'package:ocr_scanner_demo/Service/device_helper.dart';

class RequestSupport extends StatelessWidget {
  RequestSupport({super.key});

  final controller = Get.put(RequestSupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: AppColor.main,
          foregroundColor: AppColor.text1,
          elevation: 0.5,
          shadowColor: AppColor.text1,
          title: Text(
            "Yêu cầu hỗ trợ",
            style: TextStyle(
              fontSize: DeviceHelper.getFontSize(21),
              color: AppColor.text1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: AppColor.main,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SvgPicture.asset(
                'assets/icons/message-request-support.svg',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 12),
              Text(
                "Bạn chưa có tin nhắn nào.",
                style: TextStyle(
                  fontSize: DeviceHelper.getFontSize(14),
                  color: AppColor.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.subMain,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 70),
                ),
                onPressed: () {
                  // Define your onPressed logic here
                },
                child: Text(
                  "Tạo yêu cầu",
                  style: TextStyle(
                    fontSize: DeviceHelper.getFontSize(14),
                    color: AppColor.fourthMain,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
