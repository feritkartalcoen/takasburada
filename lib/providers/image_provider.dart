import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageProvider {
  ImagePicker imagePicker = ImagePicker();

  Future<File?> selectImage({required bool fromCamera}) async {
    File? file;
    try {
      PickedFile? pickedFile = await imagePicker.getImage(source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      file = File(pickedFile!.path);
      try {
        file = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square
          ],
          androidUiSettings: AndroidUiSettings(
            toolbarWidgetColor: Color(0xff707070),
            activeControlsWidgetColor: Color(0xff375675),
          ),
          compressFormat: ImageCompressFormat.png,
          compressQuality: 100,
        );
        return file;
      } catch (e) {
        print(e.toString());
        return file;
      }
    } catch (e) {
      return null;
    }
  }
}
