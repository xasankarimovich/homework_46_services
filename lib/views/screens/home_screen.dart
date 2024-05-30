import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: _productsController.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text("Malumotlar mavjud emas"),
            );
          }
          final products = snapshot.data;

          return products == null || products.isEmpty
              ? const Center(child: Text("Mahsulotlar mavjud emas"))
              : GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (_, index) {
                    final product = products[index];
                    return Card(
                      color: Colors.white,
                      elevation: 2,
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: "assets/gifs/200w.gif",
                            image: product.image[0],
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.network(products[3].image[0]);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              product.title,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
