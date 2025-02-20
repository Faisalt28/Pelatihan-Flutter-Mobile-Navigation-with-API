import 'dart:convert';

import 'package:flatter_app/model/products.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com/products';

  Future<List<Products>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Products.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}
