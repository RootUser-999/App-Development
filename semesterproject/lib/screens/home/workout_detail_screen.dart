import 'package:flutter/material.dart';
import 'video_player_screen.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String category;

  const WorkoutDetailScreen({super.key, required this.category});

  List<Map<String, String>> getWorkoutPlan() {
    return List.generate(30, (index) {
      return {
        'day': 'Day ${index + 1}',
        'videoUrl': 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
        'description': 'Workout routine for ${category.toLowerCase()} - Day ${index + 1}',
        'thumbnail': 'https://img.youtube.com/vi/BgNrzEn2vAo/0.jpg', // Placeholder
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final workouts = getWorkoutPlan();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Workouts'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: ListView.builder(
        itemCount: workouts.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemBuilder: (context, index) {
          final workout = workouts[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  workout['thumbnail']!,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                workout['day']!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Text(workout['description']!),
              trailing: IconButton(
                icon: const Icon(Icons.play_circle_fill, size: 30, color: Colors.redAccent),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => VideoPlayerScreen(
                        title: workout['day']!,
                        videoUrl: workout['videoUrl']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
