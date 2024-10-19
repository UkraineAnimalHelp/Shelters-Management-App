import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/models/account.dart';
import 'package:uah_shelters/src/repository/repository.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/ui/screens/registration/register_org_screen.dart';
import 'package:uah_shelters/src/utils/string.dart';

import '../../mocks/app_router.mocks.dart';
import '../../mocks/auth_service_mock.dart';
import '../../mocks/firebase.mocks.dart';
import '../../mocks/firestorage.mocks.dart';

void main() {
  final MockAppRouter mockRouter = MockAppRouter();
  final MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
  final AuthenticationProvider authProvider =
      AuthenticationProvider(mockAuthService);
  late MockFirebaseFirestore mockFirestore;
  late MockFirebaseStorage mockFireStorage;

  setUp(() {
    mockFirestore = MockFirebaseFirestore();
    mockFireStorage = MockFirebaseStorage();

    Repository.initialize(
        cloud: true,
        db: mockFirestore,
        fs: mockFireStorage); // Initialize with mock
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
        accountUUID: uuid,
        firstName: "Test1",
        lastName: "Test2",
        photoPath: "",
        phones: ["+380632223344"],
        links: ["hello.com"],
        inShelters: [],
        inAccessGroups: [],
        email: authProvider.user!.email!,
        isOwner: true);

    MockDocumentReference mockDocRefEmp, mockDocRefAcc;
    MockCollectionReference mockColRef;
    WriteBatch mockWriteBatch;
    DocumentSnapshot<Map<String, dynamic>> mockSnapshotEmp, mockSnapshotAcc;

    mockDocRefEmp = MockDocumentReference();
    mockDocRefAcc = MockDocumentReference();
    mockColRef = MockCollectionReference();
    mockWriteBatch = MockWriteBatch();
    mockSnapshotEmp = MockDocumentSnapshot();
    mockSnapshotAcc = MockDocumentSnapshot();

    when(mockFirestore.batch()).thenReturn(mockWriteBatch);
    when(mockFirestore.collection(any)).thenReturn(mockColRef);
    when(mockColRef.doc(authProvider.user!.id!)).thenReturn(mockDocRefEmp);
    when(mockDocRefEmp.get()).thenAnswer((_) async => mockSnapshotEmp);
    when(mockSnapshotEmp.data()).thenAnswer((_) => employee.toJson());

    when(mockColRef.doc(uuid)).thenReturn(mockDocRefAcc);
    when(mockDocRefAcc.get()).thenAnswer((_) async => mockSnapshotAcc);
    when(mockSnapshotAcc.data()).thenAnswer((_) => null);

    // Simulate button tap
    await tester.tap(find.text('Create new one'));
    await tester.pumpAndSettle();

    verify(mockFirestore.collection("accounts")).called(2);
    verify(mockColRef.doc(uuid)).called(2);

    verify(mockFirestore.collection("employees")).called(2);
    verify(mockColRef.doc(authProvider.user!.id!)).called(2);
    verify(mockDocRefEmp.get()).called(1);
    verify(mockDocRefAcc.get()).called(1);

    verify(mockWriteBatch.set(mockDocRefAcc, account.toJson())).called(1);
    verify(mockWriteBatch.set(mockDocRefEmp, employee.toJson())).called(1);
    verify(mockWriteBatch.commit()).called(1);
    verify(mockRouter.replaceAll([const HomeRoute()])).called(1);
  });

  testWidgets('Account creation failed on account exists',
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
        accountUUID: uuid,
        firstName: "Test1",
        lastName: "Test2",
        photoPath: "",
        phones: ["+380632223344"],
        links: ["hello.com"],
        inShelters: [],
        inAccessGroups: [],
        email: authProvider.user!.email!,
        isOwner: true);

    MockDocumentReference mockDocRefEmp, mockDocRefAcc;
    MockCollectionReference mockColRef;
    WriteBatch mockWriteBatch;
    DocumentSnapshot<Map<String, dynamic>> mockSnapshotEmp, mockSnapshotAcc;

    mockDocRefEmp = MockDocumentReference();
    mockDocRefAcc = MockDocumentReference();
    mockColRef = MockCollectionReference();
    mockWriteBatch = MockWriteBatch();
    mockSnapshotEmp = MockDocumentSnapshot();
    mockSnapshotAcc = MockDocumentSnapshot();

    when(mockFirestore.batch()).thenReturn(mockWriteBatch);
    when(mockFirestore.collection(any)).thenReturn(mockColRef);
    when(mockColRef.doc(authProvider.user!.id!)).thenReturn(mockDocRefEmp);
    when(mockDocRefEmp.get()).thenAnswer((_) async => mockSnapshotEmp);
    when(mockSnapshotEmp.data()).thenAnswer((_) => employee.toJson());

    when(mockColRef.doc(uuid)).thenReturn(mockDocRefAcc);
    when(mockDocRefAcc.get()).thenAnswer((_) async => mockSnapshotAcc);
    when(mockSnapshotAcc.data()).thenAnswer((_) => account.toJson());

    // Simulate button tap
    await tester.tap(find.text('Create new one'));
    await tester.pumpAndSettle();

    verify(mockFirestore.collection("accounts")).called(1);
    verify(mockColRef.doc(uuid)).called(1);

    verify(mockFirestore.collection("employees")).called(1);
    verify(mockColRef.doc(authProvider.user!.id!)).called(1);
    verify(mockDocRefEmp.get()).called(1);
    verify(mockDocRefAcc.get()).called(1);

    // debug example
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(SnackBar), findsOneWidget);
    // final snackBarFinder = find.byType(SnackBar);
    // final snackBar = tester.widget(snackBarFinder) as SnackBar;
    // Assuming the content is a Text widget
    // final textWidget = snackBar.content as Text;
    // print('SnackBar text: ${textWidget.data}');
    expect(
        find.text(
            'Failed to create new organization: Exception: Such organization already exists. Choose another one'),
        findsOneWidget);

    verifyNever(mockWriteBatch.set(mockDocRefAcc, account.toJson()));
    verifyNever(mockWriteBatch.set(mockDocRefEmp, employee.toJson()));
    verifyNever(mockWriteBatch.commit());
    verifyNever(mockRouter.replaceAll([const HomeRoute()]));
  });
}
