class BatchResult {
  final List<dynamic> documents;
  final dynamic last;

  BatchResult({required this.documents, this.last});
}

abstract class IDBStorage {
  Future<dynamic> readDoc(String collection, String key);
  Future<BatchResult> readDocs(String collection, dynamic from, int? limit);
  Future<void> updateDoc(String collection, String key, dynamic data);
  Future<void> deleteDocs(String collection, List<String> keys);

  Future<dynamic> readSubDoc(
      String collection, String subcollection, String key, String subKey);
  Future<BatchResult> readSubDocs(String collection, String subcollection,
      String key, dynamic from, int? limit);
  Future<void> updateSubDoc(String collection, String subcollection, String key,
      String subKey, dynamic data);
  Future<void> deleteSubDocs(
      String collection, String subcollection, String key, List<String> keys);
}
