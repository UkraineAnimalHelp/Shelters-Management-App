import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _fs;

  FirebaseStorageService(this._fs);

  Future<String> getFileURI(String path) async {
    return await _fs.ref(path).getDownloadURL();
  }

  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    action ??= () => {};
    Reference ref = _fs.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(action);
    return await ref.getDownloadURL();
  }
}
