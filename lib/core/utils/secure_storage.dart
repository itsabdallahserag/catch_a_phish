import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static const String rememberMeKey = "remember_me";
  static const String emailKey = "email";
  static const String passwordKey = "password";

  static Future<void> saveRememberMe({
    required bool rememberMe,
    required String email,
    required String password,
  }) async {
    await _storage.write(
      key: rememberMeKey,
      value: rememberMe.toString(),
    );

    if (rememberMe) {
      await _storage.write(
        key: emailKey,
        value: email,
      );

      await _storage.write(
        key: passwordKey,
        value: password,
      );
    } else {
      await deleteLoginData();
    }
  }

  static Future<bool> getRememberMe() async {
    String? value = await _storage.read(
      key: rememberMeKey,
    );

    return value == "true";
  }

  static Future<String?> getEmail() async {
    return await _storage.read(
      key: emailKey,
    );
  }

  static Future<String?> getPassword() async {
    return await _storage.read(
      key: passwordKey,
    );
  }

  static Future<void> deleteLoginData() async {
    await _storage.delete(key: emailKey);
    await _storage.delete(key: passwordKey);
    await _storage.delete(key: rememberMeKey);
  }
}