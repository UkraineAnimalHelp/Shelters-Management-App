import 'package:hive/hive.dart';
import 'package:uah_shelters/src/utils/db/interface.dart';

class HiveService {

  Box<dynamic> openBox(String name, [int size=25]) {
    return Hive.box(name: name, maxSizeMiB: size);
  }

  Future<dynamic> readDoc(String collection, String key) async {
    final box = openBox(collection);
    return box.get(key);
  }

  Future<BatchResult> readDocs(
      String collection, dynamic from, int? limit) async {
    final box = openBox(collection);
    return BatchResult(documents: box.getAll(box.keys).toList());
  }

  Future<void> addDoc(String collection, String key, dynamic data) async {
    updateDoc(collection, key, data);
  }

  Future<void> updateDoc(String collection, String key, dynamic data) async {
    final box = openBox(collection);
    box.put(key, data);
  }

  Future<void> deleteDocs(String collection, List<String> keys) async {
    final box = openBox(collection);
    box.deleteAll(keys);
  }

  Future<dynamic> readSubDoc(String collection, String subcollection,
      String key, String subKey) async {}

  Future<BatchResult> readSubDocs(String collection, String subcollection,
      String key, dynamic from, int? limit) async {
    return BatchResult(documents: List.empty());
  }

  Future<void> addSubDoc(String collection, String subcollection, String key,
      String subKey, dynamic data) async {}

  Future<void> updateSubDoc(String collection, String subcollection, String key,
      String subKey, dynamic data) async {}

  Future<void> deleteSubDocs(String collection, String subcollection,
      String key, List<String> keys) async {}
}
