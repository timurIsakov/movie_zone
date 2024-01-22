import 'package:movie_zone/core/services/secure_storage_service.dart';
import 'package:movie_zone/core/services/storage_keys.dart';

abstract class AuthLocalDataSource {
  Future<String?> getSessionId();
  Future<String?> getToken();

  Future<void> saveSessionId({required String token});
  Future<bool> checkActiveSession();
  Future<void> logOut();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SecureStorageService storage;

  AuthLocalDataSourceImpl(this.storage);

  @override
  Future<String?> getToken() async {
    final response = await storage.get(key: StorageKeys.token);

    return response;
  }

  @override
  Future<String?> getSessionId() async {
    final data = await storage.get(key: StorageKeys.kSession);
    return data;
  }

  @override
  Future<void> saveSessionId({required String token}) async {
    await storage.save(key: StorageKeys.kSession, value: token);
  }

  @override
  Future<bool> checkActiveSession() async {
    final response = await storage.get(key: StorageKeys.kSession);

    print("Active session $response");
    if (response == null) {
      return false;
    }
    return true;
  }

  @override
  logOut() async {
    print("Deleteall`");
    await storage.deleteAll();
  }
}
