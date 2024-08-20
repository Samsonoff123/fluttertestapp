import 'package:dio/dio.dart' as dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final dio.Dio _dio = dio.Dio();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> authenticate({required String username, required String password}) async {
    try {
      final baseUrl = defaultTargetPlatform == TargetPlatform.windows 
        ? 'http://localhost' 
        : 'http://10.0.2.2';

      print(baseUrl);
      final response = await _dio.post(
        '$baseUrl/connect/token',
        options: dio.Options(
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        ),
        data: {
          'grant_type': 'password',
          'client_id': 'b49a4e63-9233-4fad-a4ef-6b2353fdb62a',
          'username': username,
          'password': password,
          'scope': 'openid profile offline_access messenger.api',
        },
      );

      if (response.statusCode == 200) {
        await _storage.write(key: 'access_token', value: response.data['access_token']);
        await _storage.write(key: 'refresh_token', value: response.data['refresh_token']);
        await _storage.write(key: 'expires_in', value: response.data['expires_in'].toString());
        await _storage.write(key: 'token_type', value: response.data['token_type']);

        return true; 
      } else {
        return false; 
      }
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _storage.delete(key: 'access_token');
      await _storage.delete(key: 'refresh_token');
      await _storage.delete(key: 'expires_in');
      await _storage.delete(key: 'token_type');
    } catch (e) {
      print('Logout error: $e');
    }
  }
}
