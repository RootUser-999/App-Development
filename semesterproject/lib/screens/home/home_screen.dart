import 'package:flutter/material.dart';
import '../../widgets/workout_card.dart';
import 'workout_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Chest',
      'image': 'assets/images/chest.jpg',
      'description': 'Build a stronger upper body with chest workouts.',
    },
    {
      'name': 'Arms',
      'image': 'assets/images/arms.jpg',
      'description': 'Sculpt your biceps and triceps.',
    },
    {
      'name': 'Back',
      'image': 'assets/images/back.jpg',
      'description': 'Strengthen your back and posture.',
    },
    {
      'name': 'Legs',
      'image': 'assets/images/legs.jpg',
      'description': 'Grow your quads, hamstrings, and calves.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Workout'),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 3 : 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return WorkoutCard(
              title: category['name'],
              description: category['description'],
              image: category['image'],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WorkoutDetailScreen(category: category['name']),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
