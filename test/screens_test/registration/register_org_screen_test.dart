import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/repository/shelter_repository.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/ui/screens/registration/register_org_screen.dart';
import 'package:uah_shelters/src/utils/string.dart';

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
              ],
              child: child,
            )),
      ),
    );
  }

  testWidgets('RegisterOrganizationScreen displays the correct items',
      (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(RegisterOrganizationScreen()));

    expect(find.text('Create organization'), findsOneWidget);
    expect(find.text('Create new one'), findsOneWidget);
  });

  testWidgets('Create button triggers db check and Account creation',
      (WidgetTester tester) async {
    await authProvider.signInWithGoogle();
    await tester.pumpWidget(createTestableWidget(RegisterOrganizationScreen()));

    var name = "Hello World";
    var uuid = makeURI(name);
    await tester.enterText(find.byKey(const Key('orgName')), name);

    Account account = Account(
        organizationName: name, ownerUUID: authProvider.user!.id!, uuid: uuid);

    Employee employee = Employee(
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

    when(mockDBStorage.readDoc("employees", any))
        .thenAnswer((_) async => employee.toJson());

    // Simulate button tap
    await tester.tap(find.text('Create new one'));
    await tester.pumpAndSettle();

    verify(mockDBStorage.readDoc("accounts", uuid)).called(1);
    verify(mockDBStorage.readDoc("employees", authProvider.user!.id!))
        .called(1);

    verify(mockDBStorage.addDoc("accounts", uuid, account.toJson())).called(1);

    employee.accountUUID = uuid;
    employee.isOwner = true;
    verify(mockDBStorage.updateDoc(
            "employees", authProvider.user!.id!, employee.toJson()))
        .called(1);
    verify(mockRouter.replaceAll([const HomeRoute()])).called(1);
  });
}
