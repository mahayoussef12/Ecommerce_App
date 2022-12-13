import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ProductModel.dart';

class ApiServices {
  static Future<List<Product>?> fetchProducts() async {
    final response = await http.get(
        Uri.parse("https://dummyjson.com/products"));
      return productsFromJson(response.body).products;

    }



}