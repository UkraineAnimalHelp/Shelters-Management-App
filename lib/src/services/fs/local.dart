import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uah_shelters/src/services/fs/interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

class LocalStorageService implements IFSStorage {
  final FirebaseStorage _fs = FirebaseStorage.instance;

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

  @override
  Future<String> getFileURI(String filePath) async {
    final dir = await getApplicationDocumentsDirectory();
    return path.join(dir.path, filePath);
  }

  @override
  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    action ??= () => {};
    _requestPermissions();
    var realPath = await getFileURI(path);
    File copiedFile = await _copyFile(file.path, realPath);
    return copiedFile.path;
  }
}