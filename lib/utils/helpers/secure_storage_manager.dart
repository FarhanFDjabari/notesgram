import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SecureStorageManager {
  static FlutterSecureStorage secureStorage = Get.find<FlutterSecureStorage>();
  final String _tokenKey = "token";
  final String _deviceKey = "device_id";

  // Token
  //
  Future<String?> getToken() async {
    return await secureStorage.read(key: _tokenKey);
  }

  Future setToken({String? value}) async {
    return await secureStorage.write(key: _tokenKey, value: value);
  }

  // Device Token
  //
  Future<String?> getDeviceToken() async {
    return await secureStorage.read(key: _deviceKey);
  }

  Future setDeviceToken({String? value}) async {
    return await secureStorage.write(key: _deviceKey, value: value);
  }
}
