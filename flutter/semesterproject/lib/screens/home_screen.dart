import 'package:flutter/material.dart';
import 'exercise_list_screen.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ["Chest", "Shoulders", "Arms", "Legs", "Back", "Abs"];

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Category"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => AuthService().signOut(),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExerciseListScreen(category: categories[index]),
              ),
            ),
            child: Card(
              elevation: 4,
              child: Center(child: Text(categories[index], style: TextStyle(fontSize: 18))),
            ),
          );
        },
      ),
    );
  }
}
