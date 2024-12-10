import 'dart:io';

import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ocr_scanner_demo/Utils/utils.dart';

class IndividualController extends GetxController {
  Rx<File> image = Rx<File>(File(''));
  ImagePicker? imagePicker;
  RxString textInImage = ''.obs;
  RxBool isShowBalance = false.obs;
  RxInt reportTabIndex = 0.obs;
  RxInt spendingDetailsTabIndex = 0.obs;
  RxInt reportTrendTabIndex = 0.obs;
  RxInt reportExpenseTabIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    isShowBalance.value = await Utils.getBoolValueWithKey("isShowBalance");
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

  changeShowBalance() async {
    isShowBalance.value = !isShowBalance.value;
    await Utils.saveBoolWithKey("isShowBalance", isShowBalance.value);
  }
  
  changeReportTabIndex() {
    reportTabIndex.value = reportTabIndex.value == 0 ? 1 : 0;
  }
}
