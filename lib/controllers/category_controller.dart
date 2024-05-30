import 'package:flutter/foundation.dart';
import '../services/category_http_services.dart';
import '../models/category/category_model.dart';

class CategoryController {
  final CategoryHttpService categoryHttpService = CategoryHttpService();

  Future<List<CategoryModel>> getCategory() async {
    List<CategoryModel> categories =
    await categoryHttpService.getCategory();
    return categories;
  }
}
