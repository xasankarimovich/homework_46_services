import 'package:flutter/material.dart';
import '../../controllers/category_controller.dart';
import '../widgets/custom_drawer.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final _categoryController = CategoryController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: _categoryController.getCategory(),
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
              child: Text("No data available"),
            );
          }
          final categories = snapshot.data;

          return categories == null || categories.isEmpty
              ? const Center(child: Text("No categories available"))
              : ListView.builder(
            itemCount: categories.length,
            itemBuilder: (_, index) {
              final category = categories[index];
              return Card(
                color: Colors.white,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  leading: FadeInImage.assetNetwork(
                    placeholder: "assets/gifs/loading.gif",
                    image: category.image,
                    width: 50,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset("assets/images/placeholder.png", width: 50, fit: BoxFit.cover);
                    },
                  ),
                  title: Text(
                    category.name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
