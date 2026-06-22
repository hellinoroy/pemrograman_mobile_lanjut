import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductService {
  static const baseUrl = 'http://localhost:8000';

  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products/'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load products');
    }

    final List<dynamic> data =
        jsonDecode(response.body);

    return data
        .map((item) => Product.fromJson(item))
        .toList();
  }
}