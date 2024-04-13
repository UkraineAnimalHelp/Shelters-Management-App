import 'package:hive/hive.dart';
import 'package:uah_shelters/src/services/db/interface.dart';

class HiveService implements IDBStorage {
  @override
  Future<dynamic> readDoc(String collection, String key) async {
    final box = Hive.box(name: collection);
    return box.get(key);
  }

  @override
  Future<BatchResult> readDocs(
      String collection, dynamic from, int? limit) async {
    final box = Hive.box(name: collection);
    return BatchResult(documents: box.getAll(box.keys).toList());
  }

  @override
  Future<void> updateDoc(String collection, String key, dynamic data) async {
    final box = Hive.box(name: collection);
    box.put(key, data);
  }

  @override
  Future<void> deleteDocs(String collection, List<String> keys) async {
    final box = Hive.box(name: collection);
    box.deleteAll(keys);
  }


  @override
  Future<dynamic> readSubDoc(String collection, String subcollection,
      String key, String subKey) async {}

  @override
  Future<BatchResult> readSubDocs(String collection, String subcollection,
      String key, dynamic from, int? limit) async {
    return BatchResult(documents: List.empty());
  }

  @override
  Future<void> updateSubDoc(String collection, String subcollection, String key,
      String subKey, dynamic data) async {}

  @override
  Future<void> deleteSubDocs(String collection, String subcollection,
      String key, List<String> keys) async {}
}
