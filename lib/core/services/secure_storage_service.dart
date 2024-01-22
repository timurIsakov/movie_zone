import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final storage = const FlutterSecureStorage();

  Future<void> save({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<dynamic> get({required String key}) async {
    final data = await storage.read(key: key);
    return data;
  }

  Future<void> delete({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}
