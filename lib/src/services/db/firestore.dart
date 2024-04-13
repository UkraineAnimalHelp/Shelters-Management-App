import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uah_shelters/src/services/db/interface.dart';

class FirestoreService implements IDBStorage {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<dynamic> readDoc(String collection, String key) async {
    var snapshot = await _db.collection(collection).doc(key).get();
    return snapshot.data();
  }

  @override
  Future<BatchResult> readDocs(
      String collection, dynamic from, int? limit) async {
    limit = limit ?? 10;

    var query = _db.collection(collection).limit(limit);
    if (from != null && from is DocumentSnapshot) {
      query = query.startAfterDocument(from);
    }

    QuerySnapshot querySnapshot = await query.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    DocumentSnapshot? lastDocument;

    if (documents.isNotEmpty) {
      lastDocument = documents.last;
    }

    return BatchResult(documents: documents, last: lastDocument);
  }

  @override
  Future<void> updateDoc(String collection, String key, dynamic data) async {
    await _db.collection(collection).doc(key).set(data);
  }

  @override
  Future<void> deleteDocs(String collection, List<String> keys) async {
    WriteBatch batch = _db.batch();

    for (String key in keys) {
      DocumentReference docRef = _db.collection(collection).doc(key);
      batch.delete(docRef);
    }

    await batch.commit();
  }  


  @override
  Future<dynamic> readSubDoc(String collection, String subcollection,
      String key, String subKey) async {
    var snapshot = await _db
        .collection(collection)
        .doc(key)
        .collection(subcollection)
        .doc(subKey)
        .get();
    return snapshot.data();
  }

  @override
  Future<BatchResult> readSubDocs(String collection, String subcollection,
      String key, dynamic from, int? limit) async {
    limit = limit ?? 10;

    var query = _db
        .collection(collection)
        .doc(key)
        .collection(subcollection)
        .limit(limit);
    if (from != null && from is DocumentSnapshot) {
      query = query.startAfterDocument(from);
    }

    QuerySnapshot querySnapshot = await query.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    DocumentSnapshot? lastDocument;

    if (documents.isNotEmpty) {
      lastDocument = documents.last;
    }

    return BatchResult(documents: documents, last: lastDocument);
  }



  @override
  Future<void> updateSubDoc(String collection, String subcollection, String key,
      String subKey, dynamic data) async {
    await _db
        .collection(collection)
        .doc(key)
        .collection(subcollection)
        .doc(subKey)
        .set(data);
  }

  @override
  Future<void> deleteSubDocs(String collection, String subcollection,
      String key, List<String> keys) async {
    WriteBatch batch = _db.batch();

    for (String key in keys) {
      DocumentReference docRef = _db
          .collection(collection)
          .doc(key)
          .collection(subcollection)
          .doc(key);
      batch.delete(docRef);
    }

    await batch.commit();
  }
}
