import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/services/api/auth/firebase.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart'; // private
import 'src/app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (useEmulator) {
    print("#############################################################");
    print("Running in Firebase emulation mode: dev");
    print("#############################################################");
    const host = String.fromEnvironment('EMULATOR_HOST');
    // Point Firestore to the Firebase Emulator
    FirebaseFirestore.instance.settings = const Settings(
      host: '$host:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );

    // Point Firebase Auth to the Firebase Emulator
    await FirebaseAuth.instance.useAuthEmulator(host, 9099);

    // Point Firebase Auth to the Firebase Emulator
    await FirebaseStorage.instance.useStorageEmulator(host, 9199);

    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: TestUserEmail, password: TestUserPassword);

      await userCredential.user!.updateDisplayName("Google User");
      await userCredential.user!
          .updatePhotoURL("https://example.com/photo.jpg");

      userCredential.user!.linkWithCredential(GoogleAuthProvider.credential(
        idToken: "fake-id-token",
      ));
    } catch (e) {}
  }

  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
        value: AuthenticationProvider(FirebaseAuthService())),
    ChangeNotifierProvider.value(value: SettingsProvider()),
  ], child: MyApp()));
}
