import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ocr_scanner_demo/Global/app_color.dart';
import 'package:ocr_scanner_demo/Route/app_page.dart';
import 'package:ocr_scanner_demo/View/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        title: 'Image to Text Converter GetX',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.main),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            titleSpacing: 20,
            elevation: 0,
            foregroundColor: Colors.white,
            backgroundColor: AppColor.main,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppPage.initialRoute,
        getPages: AppPage.routes,
        home: Home(),
      ),
    );
  }
}
