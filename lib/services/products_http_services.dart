import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/products/product_model.dart';

class ProductsHttpService {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse("https://api.escuelajs.co/api/v1/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final body = response.body;
        final List<dynamic> jsonData = jsonDecode(body);

        List<Product> loadedProducts = jsonData
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
        return loadedProducts;
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products: $e');
    }
  }
}
