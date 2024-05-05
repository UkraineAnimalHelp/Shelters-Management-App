import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mockito/mockito.dart';
import '../../mocks/app_router.mocks.dart';
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

    expect(find.text('Join or create organization'), findsOneWidget);
    expect(find.text('Join'), findsOneWidget);
    expect(find.text('Create new one'), findsOneWidget);
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
    verify(mockRouter.push(any)).called(1);
  });

  testWidgets('Create new one button triggers navigation when tapped',
      (WidgetTester tester) async {
    await tester.pumpWidget(
        createTestableWidget(const JoinOrRegisterOrganizationScreen()));

    // Simulate button tap
    await tester.tap(find.text('Create new one'));
    await tester.pumpAndSettle();

    // Verify navigation was called
    verify(mockRouter.push(any)).called(1);
  });
}
