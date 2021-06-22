import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageProvider {
  ImagePicker imagePicker = ImagePicker();

  Future<File?> selectImage() async {
    File? file;
    try {
      PickedFile? pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
      try {
        file = await ImageCropper.cropImage(
          sourcePath: pickedFile!.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square
          ],
        );
        print("image selected");
        return file;
      } catch (e) {
        print("no image selected");
        return null;
      }
    } catch (e) {
      print("no image selected");
      return null;
    }
  }
}
