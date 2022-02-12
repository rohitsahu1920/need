
import 'package:image_picker/image_picker.dart';

import 'methods.dart';

class PickerHandler {
  final _picker = ImagePicker();

  Future<String> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        return image.path;
      } else {
        return "";
      }
    } catch (e) {
      log('pickImageFromGallery $e');
      return "";
    }
  }

  Future<String> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        log("Under Camera picker :: ${image.path}");
        return image.path;
      } else {
        return "";
      }
    } catch (e) {
      log('pickImageFromCamera $e');
      return "";
    }
  }
}
