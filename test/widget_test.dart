import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'mocks/auth_provider_mock.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/app.dart';

void main() {
  testWidgets('Home screen widget test', (WidgetTester tester) async {
    MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
    AuthenticationProvider authProvider =
        AuthenticationProvider(mockAuthService);

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationProvider>(
            create: (_) => authProvider,
          ),
        ],
        child: const MyApp(),
      ),
    );

    // Waiting splash screen to finish
    await tester.pumpAndSettle(); 

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle(); 

    // Verify the state or behavior
    expect(authProvider.user, isNotNull);

    expect(find.text('Flutter Demo Home Page'), findsOneWidget);

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
