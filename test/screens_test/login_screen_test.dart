import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/shelter.dart';
import 'package:uah_shelters/src/repository/shelter_repository.dart';
import 'package:uah_shelters/src/ui/screens/login_screen.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/models/settings.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';

import '../mocks/app_router.mocks.dart';
import '../mocks/db_storage.mocks.dart';
import '../mocks/fs_storage.mocks.dart';
import '../mocks/auth_service_mock.dart';
import '../mocks/settings_provider.mocks.dart';

void main() {
  final MockAppRouter mockRouter = MockAppRouter();
  final MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
  final AuthenticationProvider authProvider =
      AuthenticationProvider(mockAuthService);
  final mockSettingsProvider = MockSettingsProvider();

  late MockDBStorage mockDBStorage;
  late MockFSStorage mockFSStorage;

  setUp(() {
    mockDBStorage = MockDBStorage();
    mockFSStorage = MockFSStorage();
    ShelterRepository.initialize(
        mockDBStorage, mockFSStorage); // Initialize with mock
    when(mockSettingsProvider.settings)
        .thenReturn(Settings(appType: AppType.notset));
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
                ChangeNotifierProvider<SettingsProvider>.value(
                    value: mockSettingsProvider),
              ],
              child: child,
            )),
      ),
    );
  }

  testWidgets('LoginScreen displays the correct items',
      (WidgetTester tester) async {
    await authProvider.signInWithGoogle();
    await tester.pumpWidget(createTestableWidget(const LoginScreen()));

    expect(find.text("Sign in with Google"), findsOneWidget);
    expect(find.text("Use local version"), findsOneWidget);
  });

  testWidgets('LoginScreen local registration', (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(const LoginScreen()));

    await tester.tap(find.text("Use local version"));
    await tester.pumpAndSettle();

    var repo = ShelterRepository.instance;

    var employee = Employee(
        uuid: repo.getLocalUUID(),
        accountUUID: repo.getLocalUUID(),
        firstName: "",
        lastName: "",
        photoPath: "",
        phones: [],
        links: [],
        inShelters: [],
        inAccessGroups: [],
        email: "",
        isOwner: true);

    verify(mockDBStorage.addDoc(
            "employees", repo.getLocalUUID(), employee.toJson()))
        .called(1);

    var account = Account(
        uuid: repo.getLocalUUID(),
        ownerUUID: repo.getLocalUUID(),
        organizationName: "local");

    verify(mockDBStorage.addDoc(
            "accounts", repo.getLocalUUID(), account.toJson()))
        .called(1);

    var shelter = Shelter(
        uuid: repo.getLocalUUID(),
        accountUUID: repo.getLocalUUID(),
        name: "local");

    verify(mockDBStorage.addDoc(
            "shelters", repo.getLocalUUID(), shelter.toJson()))
        .called(1);

    verify(mockRouter.replaceAll([const HomeRoute()])).called(1);
  });

  testWidgets('LoginScreen cloud registration', (WidgetTester tester) async {
    await tester.pumpWidget(createTestableWidget(const LoginScreen()));
    await tester.tap(find.text("Sign in with Google"));
    await tester.pumpAndSettle();

    verify(mockDBStorage.readDoc("employees", authProvider.user!.id!))
        .called(1);

    verify(mockRouter.push(EmployeeRegistrationRoute())).called(1);
  });
}
