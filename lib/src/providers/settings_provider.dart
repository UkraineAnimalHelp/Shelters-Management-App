import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uah_shelters/src/models/settings.dart';

class SettingsProvider extends ChangeNotifier {
  Settings _settings = Settings();

  Settings get settings => _settings;

  SettingsProvider() {
    _init();
  }

  Future<void> _init() async {
    Hive.registerAdapter('Settings', Settings.fromJson);
    var box = Hive.box<Settings>(name: "settings", maxSizeMiB: 1);
    _settings = box.get("main-settings", defaultValue: Settings()) ?? _settings;

    notifyListeners();
  }

  Future<void> update(Settings newSettings) async {
    var box = Hive.box<Settings>(name: "settings", maxSizeMiB: 1);
    box.put("main-settings", newSettings);

    _settings = newSettings;

    notifyListeners();
  }
}
