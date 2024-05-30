import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../models/products/product_model.dart';
import '../widgets/custom_drawer.dart';

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> futureProducts;
  ProductsController productsController = ProductsController();

  @override
  void initState() {
    super.initState();
    futureProducts = productsController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Page'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder<List<Product>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          }
          final products = snapshot.data;

          return products == null || products.isEmpty
              ? const Center(child: Text('No products available'))
              : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                color: Colors.white,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: FadeInImage.assetNetwork(
                    placeholder: "assets/gifs/loading.gif",
                    image: product.image.first,
                    width: 50,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/placeholder.png",
                          width: 50, fit: BoxFit.cover);
                    },
                  ),
                  title: Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  subtitle: Text('\$${product.price}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
