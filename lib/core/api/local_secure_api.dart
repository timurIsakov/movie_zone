import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSecureApi {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  void save({required String key, required dynamic value}) async {
    await storage.write(key: key, value: value);
    print("Local storage saved -> ${storage.read(key: key)}");
  }

  dynamic get({required String key}) async {
    final data = await storage.read(key: key);
    print("Get local storage -> ${data.toString()}");
    return data;
  }

  void delete({required String key}) async {
    await storage.delete(key: key);
  }
}
