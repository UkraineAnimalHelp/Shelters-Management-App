import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uah_shelters/src/shared/constants/styles.dart';

class ImageHelper {
  static Future<File?> pickSquareFromGallery({
    required String title,
  }) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: title,
              toolbarColor: BaseStyle.primaryButtonColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true),
          IOSUiSettings(title: title, aspectRatioLockEnabled: true),
        ],
        compressQuality: 70,
      );
      return resize(file: File(croppedFile!.path), width: 600);
    }
    return null;
  }

  static Future<File> resize(
      {required File file,
      required int width,
      int? height,
      int? quality}) async {
    img.Image image = img.decodeImage(file.readAsBytesSync())!;

    // Resize the image to a smaller width and height to reduce file size
    img.Image resized = img.copyResize(image,
        width: width, height: height); // Adjust the size as needed

    // Save the resized image to a new file
    Directory tempDir = await getTemporaryDirectory();
    String targetPath =
        "${tempDir.path}/temp_${DateTime.now().millisecondsSinceEpoch}.jpg";
    return File(targetPath)
      ..writeAsBytesSync(img.encodeJpg(resized,
          quality: quality ?? 85)); // Adjust quality as needed
  }
}
