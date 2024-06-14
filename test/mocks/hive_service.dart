import 'package:mockito/annotations.dart';
import 'package:hive/hive.dart';
import 'package:uah_shelters/src/utils/db/hive.dart';

@GenerateMocks([], customMocks: [
  MockSpec<HiveService>(
    as: Symbol('MockHiveService'),
    onMissingStub: OnMissingStub.returnDefault,
  ),
  MockSpec<Box<dynamic>>(
    as: Symbol('MockHiveBox'),
    onMissingStub: OnMissingStub.returnDefault,
  ),
])
void main() {}
