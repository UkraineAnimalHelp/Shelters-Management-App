import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/models/shelter.dart';
import 'package:uah_shelters/src/repository/repository.dart';
import 'package:uah_shelters/src/ui/screens/login_screen.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';
import 'package:uah_shelters/src/models/settings.dart' as local_settings;
import 'package:uah_shelters/src/providers/settings_provider.dart';

import '../mocks/app_router.mocks.dart';
import '../mocks/auth_service_mock.dart';
import '../mocks/firebase.mocks.dart';
import '../mocks/firestorage.mocks.dart';
import '../mocks/hive_service.mocks.dart';
import '../mocks/settings_provider.mocks.dart';

void main() {
  final MockAppRouter mockRouter = MockAppRouter();
  final MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
  final AuthenticationProvider authProvider =
      AuthenticationProvider(mockAuthService);
  final mockSettingsProvider = MockSettingsProvider();
  late MockFirebaseFirestore mockFirestore;
  late MockFirebaseStorage mockFireStorage;
  late MockHiveService mockHiveService;
  late MockHiveBox mockHiveBox;

  setUp(() async {
    mockFirestore = MockFirebaseFirestore();
    mockFireStorage = MockFirebaseStorage();
    mockHiveService = MockHiveService();
    mockHiveBox = MockHiveBox();

    when(mockHiveService.openBox(any)).thenReturn(mockHiveBox);
    when(mockSettingsProvider.settings).thenReturn(
        local_settings.Settings(appType: local_settings.AppType.notset));

    Repository.initialize(
        cloud: false,
        db: mockFirestore,
        fs: mockFireStorage,
        hs: mockHiveService); // Initialize with mock
  });

  tearDown(() {
    Repository.reset(); // Reset after each test
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

    var repo = Repository.org();

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

    verify(mockHiveService.addDoc(
            "employees", repo.getLocalUUID(), employee.toJson()))
        .called(1);

    var account = Account(
        uuid: repo.getLocalUUID(),
        ownerUUID: repo.getLocalUUID(),
        organizationName: "local");

    verify(mockHiveService.addDoc(
            "accounts", repo.getLocalUUID(), account.toJson()))
        .called(1);

    var shelter = Shelter(
        uuid: repo.getLocalUUID(),
        accountUUID: repo.getLocalUUID(),
        name: "local");

    verify(mockHiveService.addDoc(
            "shelters", repo.getLocalUUID(), shelter.toJson()))
        .called(1);

    verify(mockRouter.replaceAll([const HomeRoute()])).called(1);
  });

  testWidgets('LoginScreen cloud registration', (WidgetTester tester) async {
    MockDocumentReference mockDocRefEmp;
    MockCollectionReference mockColRef;
    DocumentSnapshot<Map<String, dynamic>> mockSnapshotEmp;

    mockDocRefEmp = MockDocumentReference();
    mockColRef = MockCollectionReference();
    mockSnapshotEmp = MockDocumentSnapshot();

    when(mockFirestore.collection(any)).thenReturn(mockColRef);
    when(mockColRef.doc(authProvider.user!.id!)).thenReturn(mockDocRefEmp);
    when(mockDocRefEmp.get()).thenAnswer((_) async => mockSnapshotEmp);

    await tester.pumpWidget(createTestableWidget(const LoginScreen()));
    await tester.tap(find.text("Sign in with Google"));
    await tester.pumpAndSettle();

    verify(mockDocRefEmp.get()).called(1);

    verify(mockRouter.push(EmployeeRegistrationRoute())).called(1);
  });
}
