import "dart:io";
import 'dart:async';

abstract class IFSStorage {
  Future<String> getFileURI(String path);

  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action);
}
