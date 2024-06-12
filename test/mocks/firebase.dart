import 'package:mockito/annotations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<FirebaseFirestore>(
      as: Symbol('MockFirebaseFirestore'),
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<CollectionReference<Map<String, dynamic>>>(
      as: Symbol('MockCollectionReference'),
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<DocumentReference<Map<String, dynamic>>>(
      as: Symbol('MockDocumentReference'),
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<WriteBatch>(
      as: Symbol('MockWriteBatch'),
      onMissingStub: OnMissingStub.returnDefault,
    ),
    MockSpec<DocumentSnapshot<Map<String, dynamic>>>(
      as: Symbol('MockDocumentSnapshot'),
      onMissingStub: OnMissingStub.returnDefault,
    )
  ],
)
void main() {}
