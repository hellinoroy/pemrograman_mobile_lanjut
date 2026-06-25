import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/comment.dart';

class CommentService {
  static const baseUrl = 'http://localhost:8000';
  static const storage = FlutterSecureStorage();

  static Future<Map<String, String>> headers() async {
    final token =
        await storage.read(
      key: 'token',
    );

    return {
      'Content-Type':
          'application/json',

      if (token != null)
        'Authorization':
            'Bearer $token',
    };
  }

  static Future<List<Comment>> getComments(int productId) async {
      final res =
          await http.get(
        Uri.parse(
          '$baseUrl/products/$productId/comments',
        ),
      );

      if (res.statusCode != 200) {
        throw Exception(
          'Failed to load comments',
        );
      }

      final List data =
          jsonDecode(
        res.body,
      );

      return data
          .map(
            (e) =>
                Comment.fromJson(
              e,
            ),
          )
          .toList();
  }

  static Future<void> createComment({
    required int productId,
    required String comment,
    required double rating,
  }) async {
    final res =
        await http.post(
      Uri.parse(
        '$baseUrl/products/$productId/comments',
      ),

      headers:
          await headers(),

      body: jsonEncode({
        'comment':
            comment,

        'rating':
            rating,
      }),
    );

    if (
        res.statusCode != 200 &&
        res.statusCode != 201) {
      throw Exception(
      res.body,
    );
  }}

  static Future<void> updateComment({
    required int productId,
    required int id,
    required String comment,
    required double rating,
  }) async {
    final res =
        await http.put(
      Uri.parse(
        '$baseUrl/products/$productId/comments/$id',
      ),

      headers:
          await headers(),

      body: jsonEncode({
        'comment':
            comment,

        'rating':
            rating,
      }),
    );

    if (res.statusCode != 200) {
      throw Exception(
        res.body,
      );
    }}


  static Future<void> deleteComment({
    required int productId,
    required int id,
  }) async {
    final res =
        await http.delete(
      Uri.parse(
        '$baseUrl/products/$productId/comments/$id',
        ),

      headers:
          await headers(),
    );

    if (res.statusCode != 200) {
      throw Exception(
        res.body,
      );
    }
  }



}