import 'package:get/get.dart';
import 'package:ocr_scanner_demo/View/Budget/budget.dart';
import 'package:ocr_scanner_demo/View/Home/home.dart';
import 'package:ocr_scanner_demo/View/Individual/RequestSupport/create_request.dart';
import 'package:ocr_scanner_demo/View/Individual/RequestSupport/request_support.dart';
import 'package:ocr_scanner_demo/View/PickImage/pick_image.dart';
import 'package:ocr_scanner_demo/View/TransactionBook/transaction_book.dart';
import 'package:ocr_scanner_demo/View/dashboard.dart';

part 'app_route.dart';

class AppPage {
  AppPage._();

  static const String initialRoute = Routes.dashboard;

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: Routes.dashboard, page: () => Dashboard()),
    GetPage(name: Routes.home, page: () => Home()),
    GetPage(name: Routes.pickImage, page: () => PickImage()),
    GetPage(name: Routes.requestSupport, page: () => RequestSupport()),
    GetPage(name: Routes.createRequest, page: () => CreateRequest()),
    GetPage(name: Routes.transactionBook, page: () => TransactionBook()),
    GetPage(name: Routes.budget, page: () => Budget()),
  ];
}
