import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxBool isLoading = true.obs;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() async {
    isLoading.value = false;
    super.onInit();
  }
  
  changePage(int index) {
    currentIndex.value = index;
  }
}
