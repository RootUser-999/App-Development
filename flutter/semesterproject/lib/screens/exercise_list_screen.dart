import 'package:flutter/material.dart';
import 'exercise_detail_screen.dart';

class ExerciseListScreen extends StatelessWidget {
  final String category;
  const ExerciseListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$category - 30 Day Plan")),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text("Day ${index + 1} Exercise"),
            subtitle: Text("Simple ${category.toLowerCase()} workout for day ${index + 1}"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExerciseDetailScreen(
                  day: index + 1,
                  category: category,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
