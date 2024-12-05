import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    print('on close second');
    super.onClose();
  }
}
