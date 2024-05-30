import '../models/products/product_model.dart';
import '../services/products_http_services.dart';

class ProductsController {
  ProductsHttpService productsHttpService = ProductsHttpService();

  Future<List<Product>> getProducts() async {
    List<Product> products = await productsHttpService.getProducts();
    return products;
  }
}
