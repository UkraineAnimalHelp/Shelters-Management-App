import 'package:mockito/annotations.dart';
import 'package:firebase_storage/firebase_storage.dart';

@GenerateMocks([], customMocks: [
  MockSpec<FirebaseStorage>(
    as: Symbol('MockFirebaseStorage'),
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<Reference>(
    as: Symbol('MockReference'),
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<UploadTask>(
    as: Symbol('MockUploadTask'),
    onMissingStub: OnMissingStub.returnDefault,
  ),
])
void main() {}
