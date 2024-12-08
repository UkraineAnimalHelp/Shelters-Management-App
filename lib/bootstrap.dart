import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uah_shelters/di.dart';
import 'package:uah_shelters/firebase_options.dart';

/// Bootstrap is responsible for any common setup and calls
/// [runApp] with the widget returned by [builder] in an error zone.
Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initDI();

  final dir = await getApplicationDocumentsDirectory();

  Hive.defaultDirectory = dir.path;

  runApp(await builder());
}
