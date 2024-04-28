import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uah_shelters/src/services/db/interface.dart';

class DBStorage extends Mock implements IDBStorage {}

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<DBStorage>(
      as: Symbol('MockDBStorage'),
      onMissingStub: OnMissingStub.returnDefault,
    )
  ],
)
void main() {}
