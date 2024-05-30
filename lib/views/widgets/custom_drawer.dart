import 'package:flutter/material.dart';
import 'package:homework_46_services/views/screens/product_screen.dart';

import '../screens/category_screen.dart';
import '../screens/home_screen.dart';
import '../screens/users_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              // color: Colors.amber,
              image: DecorationImage(
                image: NetworkImage(
                  "https://cdn.pixabay.com/photo/2024/02/27/00/13/heliconia-8599119_1280.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("MENYU"),
              ],
            ),
          ),
          // ListTile(
          //   onTap: () {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (ctx) {
          //           return HomeScreen();
          //         },
          //       ),
          //     );
          //   },
          //   title: const Text("Bosh sahifa"),
          //   trailing: const Icon(
          //     Icons.keyboard_arrow_right,
          //   ),
          // ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return UsersScreen();
                  },
                ),
              );
            },
            title: const Text("Userlar"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return CategoriesScreen();
                  },
                ),
              );
            },
            title: const Text("categories"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),

          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return ProductsScreen();
                  },
                ),
              );
            },
            title: const Text("Products"),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
