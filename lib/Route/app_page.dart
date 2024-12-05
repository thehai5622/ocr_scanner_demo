import 'package:get/get.dart';
import 'package:ocr_scanner_demo/View/Home/home.dart';

part 'app_route.dart';

class AppPage {
  AppPage._();

  static const String initialRoute = Routes.home;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: Routes.home, page: () => Home()),
  ];
}
