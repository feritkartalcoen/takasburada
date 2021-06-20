import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageOrVideo with ChangeNotifier {
  File _file = File("");
  ImagePicker _imagePicker = ImagePicker();

  Future<String> captureImage() async {
    PickedFile? pickedFile = await _imagePicker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _file = File(pickedFile.path);
      notifyListeners();
      return "image captured";
    } else {
      return "no image captured";
    }
  }

  Future<String> selectImage() async {
    PickedFile? pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _file = File(pickedFile.path);
      notifyListeners();
      return "image selected";
    } else {
      return "no image selected";
    }
  }

  File get file => _file;

  resetFile() {
    _file = File("");
  }
}
