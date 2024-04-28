import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/repository/shelter_repository.dart';
import 'package:uah_shelters/src/ui/screens/registration/employee_registration_screen.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';

import '../../mocks/app_router.mocks.dart';
import '../../mocks/db_storage.mocks.dart';
import '../../mocks/fs_storage.mocks.dart';
import '../../mocks/auth_service_mock.dart';

void main() {
  final MockAppRouter mockRouter = MockAppRouter();
  final MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
  final AuthenticationProvider authProvider =
      AuthenticationProvider(mockAuthService);
  late MockDBStorage mockDBStorage;
  late MockFSStorage mockFSStorage;

  setUp(() {
    mockDBStorage = MockDBStorage();
    mockFSStorage = MockFSStorage();
    ShelterRepository.initialize(
        mockDBStorage, mockFSStorage); // Initialize with mock
  });

  tearDown(() {
    ShelterRepository.reset(); // Reset after each test
  });

  Widget createTestableWidget(Widget child) {
    return MaterialApp(
      home: Material(
        child: StackRouterScope(
            controller: mockRouter,
            stateHash: 0,
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: authProvider),
                // ChangeNotifierProvider<SettingsProvider>.value(
                //     value: mockSettingsProvider),
              ],
              child: child,
            )),
      ),
    );
  }

  testWidgets('EmployeeRegistrationScreen pass all steps',
      (WidgetTester tester) async {
    await authProvider.signInWithGoogle();
    await tester.pumpWidget(createTestableWidget(EmployeeRegistrationScreen()));

    await tester.enterText(find.byKey(const Key('firstName')), "Test1");
    await tester.enterText(find.byKey(const Key('lastName')), "Test2");

    await tester.tap(find.text('Next step'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byKey(const Key('phone')), "+380632223344");
    await tester.enterText(find.byKey(const Key('linkedinLink')), "hello.com");

    await tester.tap(find.text('Next step'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    var model = Employee(
        uuid: authProvider.user!.id!,
        accountUUID: null,
        firstName: "Test1",
        lastName: "Test2",
        photoPath: "",
        phones: ["+380632223344"],
        links: ["hello.com"],
        inShelters: [],
        inAccessGroups: [],
        email: authProvider.user!.email!,
        isOwner: false);

    verify(mockDBStorage.addDoc(
            "employees", authProvider.user!.id!, model.toJson()))
        .called(1);
    model.photoPath = "users/${authProvider.user!.id!}/profile.jpg";
    verify(mockFSStorage.uploadFile(any, any, null)).called(1);
    verify(mockDBStorage.updateDoc(
            "employees", authProvider.user!.id!, model.toJson()))
        .called(1);
  });
}
