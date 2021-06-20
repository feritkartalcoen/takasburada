import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageProvider {
  ImagePicker imagePicker = ImagePicker();

  Future<File?> selectImage() async {
    File file;
    try {
      PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
      file = File(pickedFile!.path);
      print("image selected");
      return file;
    } catch (e) {
      print("no image selected");
      return null;
    }
  }
}
