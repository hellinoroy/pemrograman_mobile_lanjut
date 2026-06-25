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

static Future<bool> login({
  required String email,
  required String password,
  }) async {
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

    final data =
        jsonDecode(
      res.body,
    );

    await storage.write(
      key: 'token',
      value:
          data[
              'access_token'],
    );

    await storage.write(
      key: 'user_id',
      value:
          data['user']['id']
              .toString(),
    );

    await storage.write(
      key: 'user_nama',
      value:
          data['user']['nama'],
    );

    await storage.write(
      key: 'user_email',
      value:
          data['user']['email'],
    );

    return true;
  }

  static Future<String?> getToken() async {
    return storage.read(
      key: 'token',
    );
  }

  static Future<String?> getUserId() async {
    return storage.read(
      key: 'user_id',
    );
  }

  static Future<String?> getUserNama() async {
    return storage.read(
      key: 'user_nama',
    );
  }

  static Future<String?> getUserEmail() async {
    return storage.read(
      key: 'user_email',
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
    await storage.deleteAll();
  }
}