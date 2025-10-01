import 'package:flutter_secure_storage/flutter_secure_storage.dart';

//SecureStorageManager
class S2Manager {
  static final _storage = new FlutterSecureStorage();

  static Future<void> saveData(String key, String data) async {
    await _storage.write(key: key, value: data);
    print('$key의 데이터 $data를 저장했습니다.');
  }

  static Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
    print('$key의 데이터를 삭제했습니다.');
  }

  static Future<void> deleteAllData() async {
    await _storage.deleteAll();
    print('데이터를 모두 삭제했습니다.');
  }

  static Future<String?> readData(String key) async {
    String? value = await _storage.read(key: key);
    print('$key의 데이터를 불러왔습니다.');
    return value;
  }
}
