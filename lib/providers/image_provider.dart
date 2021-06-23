import 'dart:io';
/* // ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html; */

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageProvider {
  ImagePicker imagePicker = ImagePicker();

  Future<File?> selectImage() async {
    File? file;
    try {
      PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
      file = File(pickedFile!.path);
      try {
        file = await ImageCropper.cropImage(
          sourcePath: pickedFile.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square
          ],
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

  /* Future<html.File?> selectImageForWeb() async {
    html.File? file;
    try {
      PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
      file = html.File(pickedFile!.path.codeUnits, pickedFile.path);
      return file;
    } catch (e) {
      return null;
    }
  } */
}
