import 'package:flutter/material.dart';
import 'package:homework_46_services/views/screens/category_screen.dart';
import 'package:homework_46_services/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}