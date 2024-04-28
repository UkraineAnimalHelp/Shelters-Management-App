import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uah_shelters/src/services/fs/interface.dart';

class FirebaseStorageService implements IFSStorage {
  final FirebaseStorage _fs = FirebaseStorage.instance;

  @override
  Future<String> getFileURI(String path) async {
    return await _fs.ref(path).getDownloadURL();
  }

  @override
  Future<String> uploadFile(
      String path, File file, FutureOr<dynamic> Function()? action) async {
    action ??= () => {};
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(action);
    return await ref.getDownloadURL();
  }
}
