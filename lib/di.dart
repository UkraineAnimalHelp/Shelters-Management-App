import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  _registerAppStorage();
  _registerAuthService();
  return getIt.allReady();
}

void _registerAppStorage() {
  getIt.registerSingletonAsync<AppKeyValueStorage>(
    () async {
      final storage = await SharedPreferences.getInstance();

      return AppKeyValueStorageImpl(storage);
    },
  );
}

void _registerAuthService() {
  getIt.registerSingletonWithDependencies<AuthService>(() {
    final appStorage = getIt<AppKeyValueStorage>();

    return AuthServiceImpl(appStorage);
  }, dependsOn: [AppKeyValueStorage]);
}
