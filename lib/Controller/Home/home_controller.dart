import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  String result = '';
  Rx<File> image = Rx<File>(File(''));
  ImagePicker? imagePicker;
  RxString textInImage = 'Thế Hải'.obs;

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

  performImageLabeling() async {
    if (image.value.path == "") {
      print("image is empty");
      return;
    }

    try {
      // 1. Tạo đối tượng InputImage từ file ảnh
      final inputImage = InputImage.fromFile(image.value);

      // 2. Tạo TextRecognizer từ plugin mới
      final textRecognizer = TextRecognizer();

      // 3. Xử lý ảnh để nhận dạng văn bản
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      // 4. Lưu kết quả vào biến textInImage
      textInImage.value = recognizedText.text;

      // 5. In từng dòng văn bản
      for (TextBlock block in recognizedText.blocks) {
        print('Block text: ${block.text}');
        for (TextLine line in block.lines) {
          print('Line text: ${line.text}');
        }
      }

      // 6. Giải phóng tài nguyên
      textRecognizer.close();
    } catch (e) {
      print('Error during text recognition: $e');
    }
  }

  clearImage() {
    image.value = File('');
  }
}
