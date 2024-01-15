import 'package:movie_zone/core/services/secure_storage_service.dart';

abstract class AuthLocalDataSource {
  Future<String?> getSessionId();
  Future<void> saveSessionId({required String token});
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SecureStorageService storage;

  AuthLocalDataSourceImpl(this.storage);
  @override
  Future<String?> getSessionId() async {
    final data = await storage.get(key: 'token');
    return data;
  }

  @override
  Future<void> saveSessionId({required String token}) async {
    storage.save(key: 'token', value: token);
  }
}
