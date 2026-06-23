import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductDetailService {
  static const _baseUrl = 'http://localhost:8000';

  // Future<List<Product>> getProducts() async {
  //   try {
  //     final response = await http.get(Uri.parse(_baseUrl));

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = json.decode(response.body);
  //       return data.map((json) => Product.fromJson(json)).toList();
  //     } else {
  //       throw Exception('Failed to load products: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching products: $e');
  //   }
  // }

  Future<Product> getProductById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

      if (response.statusCode == 200) {
        return Product.fromJson(json.decode(response.body));
      } else {
        throw Exception('Product not found');
      }
    } catch (e) {
      throw Exception('Error fetching product: $e');
    }
  }
}