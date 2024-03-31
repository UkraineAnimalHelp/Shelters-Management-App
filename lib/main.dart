import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uah_shelters/src/services/api/auth/firebase.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'firebase_options.dart'; // private
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(
        value: AuthenticationProvider(FirebaseAuthService())),
  ], child: const MyApp()));
}
