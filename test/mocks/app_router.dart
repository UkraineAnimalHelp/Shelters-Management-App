import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:auto_route/auto_route.dart';
import 'package:uah_shelters/src/constants/constants.dart';

class TestRouter extends Mock implements AppRouter, StackRouter {}

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<TestRouter>(
      as: Symbol('MockAppRouter'),
      onMissingStub: OnMissingStub.returnDefault,
    )
  ],
)
void main() {}
