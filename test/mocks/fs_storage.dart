import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uah_shelters/src/services/fs/interface.dart';

class FSStorage extends Mock implements IFSStorage {}

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<FSStorage>(
      as: Symbol('MockFSStorage'),
      onMissingStub: OnMissingStub.returnDefault,
    )
  ],
)
void main() {}
