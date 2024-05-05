import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/ui/screens/registration/join_org_screen.dart';

import '../../mocks/auth_service_mock.dart';

void main() {
  final MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
  final AuthenticationProvider authProvider =
      AuthenticationProvider(mockAuthService);

  Widget createTestableWidget(Widget child) {
    return MaterialApp(
      home: Material(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: authProvider),
          ],
          child: child,
        ),
      ),
    );
  }

  testWidgets('JoinOrganizationScreen displays the correct items',
      (WidgetTester tester) async {
    await authProvider.signInWithGoogle();
    await tester
        .pumpWidget(createTestableWidget(const JoinOrganizationScreen()));

    expect(find.text(authProvider.user!.id!), findsOneWidget);
  });
}
