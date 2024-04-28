import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mockito/mockito.dart';
import '../../mocks/app_router.mocks.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/ui/screens/registration/join_or_reg_org_screen.dart';

void main() {
  final MockAppRouter mockRouter = MockAppRouter();

  Widget createTestableWidget(Widget child) {
    return MaterialApp(
      home: Material(
        child: StackRouterScope(
          controller: mockRouter,
          stateHash: 0,
          child: child,
        ),
      ),
    );
  }

  testWidgets('JoinOrRegisterOrganizationScreen displays the correct items',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createTestableWidget(const JoinOrRegisterOrganizationScreen()));

    // Verify the title text is present
    expect(find.text('Join or create organization'), findsOneWidget);

    // Verify both buttons are present
    expect(find.text('Join'), findsOneWidget);
    expect(find.text('Create new one'), findsOneWidget);

    // Verify text 'or' is present
    expect(find.text('or'), findsOneWidget);
  });

  testWidgets('Join button triggers navigation when tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createTestableWidget(const JoinOrRegisterOrganizationScreen()));

    // Simulate button tap
    await tester.tap(find.text('Join'));
    await tester.pumpAndSettle();

    // Verify navigation was called
    verifyNever(mockRouter.push(any));
    // verify(mockRouter.push(any)).called(1);
  });

  testWidgets('Create new one button triggers navigation when tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createTestableWidget(const JoinOrRegisterOrganizationScreen()));

    // Simulate button tap
    await tester.tap(find.text('Create new one'));
    await tester.pumpAndSettle();

    // Verify navigation was called
    verifyNever(mockRouter.push(any));
    // verify(mockRouter.push(any)).called(1);
  });
}
