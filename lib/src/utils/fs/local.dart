import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class LocalStorageService{
  Future<bool> _requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<File> _copyFile(String sourcePath, String destinationPath) async {
    File sourceFile = File(sourcePath);
    File destinationFile = File(destinationPath);

    try {
      // Check if the destination directory exists, if not, create it
      await destinationFile.create(recursive: true);
      // Copy the file
      return await sourceFile.copy(destinationFile.path);
    } catch (e) {
      // Handle the error, e.g., by throwing an exception
      throw Exception('Failed to copy file: $e');
    }
  }

  Future<String> getFileURI(String filePath) async {
    final dir = await getApplicationDocumentsDirectory();
    return path.join(dir.path, filePath);
  }

  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    action ??= () => {};
    _requestPermissions();
    var realPath = await getFileURI(path);
    File copiedFile = await _copyFile(file.path, realPath);
    return copiedFile.path;
  }
}
