import 'package:flutter/material.dart';
import 'package:uah_shelters/src/bootstrap.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => MyApp());
}
