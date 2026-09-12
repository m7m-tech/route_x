import 'dart:io';
import 'package:image_picker/image_picker.dart';

/// Abstract service to handle picking images from device storage or camera.
abstract class ImagePickerService {
  Future<File?> pickImage(bool fromCamera);
}

/// Concrete implementation of [ImagePickerService] using the `image_picker` package.
///
/// Images are constrained to 512×512 at 85 % quality to keep upload payloads
/// small and profile pictures performant.
class ImagePickerServiceImpl implements ImagePickerService {
  /// The underlying platform image picker.
  final ImagePicker _picker = ImagePicker();

  /// Opens the device camera or gallery and returns the picked image as a [File].
  ///
  /// Returns `null` when the user cancels the picker.
  @override
  Future<File?> pickImage(bool fromCamera) async {
    final XFile? xFile = await _picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 512,
      maxHeight: 512,
    );
    if (xFile == null) return null;
    return File(xFile.path);
  }
}
