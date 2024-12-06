import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class PickImageController extends GetxController {
  Rx<File> image = Rx<File>(File(''));
  ImagePicker? imagePicker;
  RxString textInImage = ''.obs;

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
      performImageLabeling();
    }
  }

  pickImageFromCamera() async {
    imagePicker ??= ImagePicker();
    XFile? pickedFile =
        await imagePicker!.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
      performImageLabeling();
    }
  }

  performImageLabeling() async {
    try {
      final inputImage = InputImage.fromFile(image.value);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);

      textInImage.value = recognizedText.text;

      // 5. In từng dòng văn bản
      for (TextBlock block in recognizedText.blocks) {
        print('Block text: ${block.text}');
        for (TextLine line in block.lines) {
          print('Line text: ${line.text}');
        }
      }

      textRecognizer.close();
    } catch (e) {
      print('Error during text recognition: $e');
    }
  }

  clearImage() {
    image.value = File('');
    textInImage.value = '';
  }
}
