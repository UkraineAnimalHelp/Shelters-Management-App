// ignore_for_file: unused_element

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uah_shelters/src/shared/storage/storage_keys.dart';

abstract class AppKeyValueStorage {
  Future<bool> setOrganizationId(String organizationId);

  String? getOrganizationId();

  Future<void> clear();
}

class AppKeyValueStorageImpl implements AppKeyValueStorage {
  const AppKeyValueStorageImpl(this._preferences);

  final SharedPreferences _preferences;

  T? getObject<T>(
    String key,
    T? Function(Map<String, dynamic> v) objectDecoder,
  ) {
    final objectMap = _getObjectMap(key);
    if (objectMap == null) return null;

    return objectDecoder(objectMap);
  }

  Map<String, dynamic>? _getObjectMap(String key) {
    final data = _preferences.getString(key);
    return (data == null || data.isEmpty)
        ? null
        : json.decode(data) as Map<String, dynamic>;
  }

  Future<bool> _putObject(String key, Object value) {
    return _preferences.setString(key, jsonEncode(value));
  }

  Future<bool> _putListObject<T>(String key, List<T> list) async {
    final encodedList = list.map(jsonEncode).toList();
    await _preferences.setStringList(key, encodedList);
    return true;
  }

  List<T> _getListObject<T>(
    String key,
    T Function(Map<String, dynamic>? v) fromJson,
  ) {
    final encodedList = _preferences.getStringList(key);
    if (encodedList != null) {
      final decodedList = encodedList.map(jsonDecode).toList();
      final list = decodedList
          .cast<Map<String, dynamic>>()
          .map<T>((e) => fromJson(e))
          .toList();
      return list;
    } else {
      return [];
    }
  }

  @override
  Future<void> clear() => _preferences.clear();

  @override
  String? getOrganizationId() {
    return _preferences.getString(LocalStorageKeys.organizationId);
  }

  @override
  Future<bool> setOrganizationId(String organizationId) {
    return _preferences.setString(
        LocalStorageKeys.organizationId, organizationId);
  }
}
