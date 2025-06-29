import 'package:flutter/material.dart';
import 'package:semesterproject/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // <-- must be const if used in test

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const Placeholder(), // Replace with your actual home
    );
  }
}
