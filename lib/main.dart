import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uah_shelters/src/services/api/auth/firebase.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'firebase_options.dart'; // private
import 'src/app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
        value: AuthenticationProvider(FirebaseAuthService())),
    ChangeNotifierProvider.value(
        value: SettingsProvider()),
  ], child: MyApp()));
}
