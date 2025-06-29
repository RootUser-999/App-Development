import 'package:flutter/material.dart';
import 'package:semesterproject/screens/home/workout_detail_screen.dart';
import 'package:semesterproject/widgets/workout_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<Map<String, dynamic>> categories = [
    {
      'name': 'Chest',
      'image': 'lib/assets/images/exercises/chest.JPG',
      'description': 'Build a stronger upper body with chest workouts.',
      'workouts': [
        {'title': 'Push Ups', 'duration': '15 mins'},
        {'title': 'Bench Press', 'duration': '20 mins'},
      ],
    },
    {
      'name': 'Arms',
      'image': 'lib/assets/images/exercises/arms.JPG',
      'description': 'Sculpt your biceps and triceps.',
      'workouts': [
        {'title': 'Bicep Curls', 'duration': '10 mins'},
        {'title': 'Tricep Dips', 'duration': '12 mins'},
      ],
    },
    {
      'name': 'Back',
      'image': 'lib/assets/images/exercises/back.JPG',
      'description': 'Strengthen your back and posture.',
      'workouts': [
        {'title': 'Deadlifts', 'duration': '25 mins'},
        {'title': 'Pull Ups', 'duration': '15 mins'},
      ],
    },
    {
      'name': 'Legs',
      'image': 'lib/assets/images/exercises/legs.JPG',
      'description': 'Grow your quads, hamstrings, and calves.',
      'workouts': [
        {'title': 'Squats', 'duration': '20 mins'},
        {'title': 'Lunges', 'duration': '15 mins'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Workout'),
        backgroundColor: Colors.blue.shade900,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTablet ? 3 : 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return WorkoutCard(
              title: category['name'],
              description: category['description'],
              image: category['image'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WorkoutDetailScreen(
                      category: category['name'],
                      workouts: category['workouts'],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
