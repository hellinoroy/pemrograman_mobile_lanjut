import 'dart:convert';

import 'package:http/http.dart'
    as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const storage =
      FlutterSecureStorage();

  static const baseUrl =
      'http://localhost:8000';

  static Future<bool> register({
    required String nama,
    required String email,
    required String password,
  }) async {
    final res = await http.post(
      Uri.parse(
        '$baseUrl/auth/register',
      ),

      headers: {
        'Content-Type':
            'application/json',
      },

      body: jsonEncode({
        'nama': nama,
        'email': email,
        'password': password,
      }),
    );

    if (res.statusCode != 201) {
      return false;
    }

    return true;
  }

  static Future<bool> login({required String email, required String password,}) async {
    final res = await http.post(
      Uri.parse(
        '$baseUrl/auth/login',
      ),

      headers: {
        'Content-Type':
            'application/json',
      },

      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (res.statusCode != 200) {
      return false;
    }

    final data = jsonDecode(
      res.body,
    );

    await storage.write(key: 'token', value:data['access_token'],);

    return true;
  }

  static Future<String?>
      getToken() async {
    return storage.read(
      key: 'token',
    );
  }

  static Future<bool> isLoggedIn() async {
    final token =
        await storage.read(
      key: 'token',
    );

    return token != null &&
        token.isNotEmpty;
  }

  static Future<void> logout() async {
    await storage.delete(
      key: 'token',
    );
  }
}