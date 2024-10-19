import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/firebase_options.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:uah_shelters/src/services/api/auth/firebase.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final dir = await getApplicationDocumentsDirectory();

  Hive.defaultDirectory = dir.path;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
        value: AuthenticationProvider(FirebaseAuthService())),
    ChangeNotifierProvider.value(value: SettingsProvider())
  ], child: await builder()));
}
