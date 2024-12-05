import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  String result = '';
  Rx<File> image = Rx<File>(File(''));
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
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      print("this is path: ${image.value.uri}");
    }
  }

  pickImageFromCamera() async {
    imagePicker ??= ImagePicker();
    XFile? pickedFile =
        await imagePicker!.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      print("this is path: ${image.value.uri}");
    }
  }

  clearImage() {
    image.value = File('');
  }
}
