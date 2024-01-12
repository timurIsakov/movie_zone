import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final storage = const FlutterSecureStorage();

  void save({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  dynamic get({required String key}) async {
    final data = await storage.read(key: key);
    return data;
  }

  void delete({required String key}) async {
    await storage.delete(key: key);
  }

  void deleteAll() async {
    await storage.deleteAll();
  }
}
