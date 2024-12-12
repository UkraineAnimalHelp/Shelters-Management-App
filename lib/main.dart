import 'package:flutter/material.dart';
import 'package:uah_shelters/bootstrap.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => MyApp());
}
