import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  String result = '';
  Rx<File>? image;
  ImagePicker? imagePicker;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    print('on close second');
    super.onClose();
  }

  pickImageFromGallery() async {
    imagePicker ??= ImagePicker();
    XFile? pickedFile =
        await imagePicker!.pickImage(source: ImageSource.gallery);
    image!.value = File(pickedFile!.path);
  }
}
