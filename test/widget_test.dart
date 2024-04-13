import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'mocks/auth_service_mock.dart';
import 'mocks/settings_provider_mock.mocks.dart';
import 'package:uah_shelters/src/models/settings.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:uah_shelters/src/app.dart';

void main() {
  testWidgets('Home screen widget test', (WidgetTester tester) async {
    final MockFirebaseAuthService mockAuthService = MockFirebaseAuthService();
    final AuthenticationProvider authProvider =
        AuthenticationProvider(mockAuthService);

    final mockSettingsProvider = MockSettingsProvider();

    when(mockSettingsProvider.settings).thenReturn(Settings(
        appType: AppType.cloud)); // Adjust as necessary for specific test cases

    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
              value: authProvider),
          ChangeNotifierProvider<SettingsProvider>.value(
              value: mockSettingsProvider),
        ],
        child: MyApp(),
      ),
    );

    // Waiting splash screen to finish
    await tester
        .pump(const Duration(seconds: 2)); // Adjust the time as necessary
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify the state or behavior
    expect(authProvider.user, isNotNull);

    expect(find.text('Animal Manager'), findsOneWidget);

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
