import 'package:mockito/annotations.dart';
import 'package:uah_shelters/src/utils/fs/local.dart';

@GenerateMocks([], customMocks: [
  MockSpec<LocalStorageService>(
    as: Symbol('MockLocalStorageService'),
    onMissingStub: OnMissingStub.returnDefault,
  ),
])
void main() {}
