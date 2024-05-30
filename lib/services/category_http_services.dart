import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/category/category_model.dart';

class CategoryHttpService {
  Future<List<CategoryModel>> getCategory() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/categories");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        final List<dynamic> jsonData = jsonDecode(body);

        List<CategoryModel> loadedCategory = jsonData
            .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return loadedCategory;
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load categories: $e');
    }
  }
}
