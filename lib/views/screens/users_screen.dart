import 'package:flutter/material.dart';

import '../../controllers/user_controller.dart';
import '../widgets/custom_drawer.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  final _usersController = CategorysController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: _usersController.getUsers(),
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
          final users = snapshot.data;

          return users == null || users.isEmpty
              ? const Center(child: Text("Mahsulotlar mavjud emas"))
              : GridView.builder(
            itemCount: users.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 250,
            ),
            itemBuilder: (_, index) {
              final user = users[index];
              return Card(
                color: Colors.white,
                elevation: 2,
                clipBehavior: Clip.hardEdge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInImage.assetNetwork(
                      placeholder: "gifs/gif.gif.gif.gif",
                      image: user.image,
                      height: 150,
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.network(users[3].image);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        user.email,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),
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