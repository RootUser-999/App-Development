import 'package:flutter/material.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final String category;
  final List<Map<String, String>> workouts;

  const WorkoutDetailScreen({
    super.key,
    required this.category,
    required this.workouts,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category Workouts'),
        backgroundColor: Colors.deepPurple.shade700,
        elevation: 6,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: workouts.isEmpty
            ? const Center(
                child: Text(
                  'No workouts found.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              )
            : ListView.separated(
                itemCount: workouts.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final workout = workouts[index];
                  final title = workout['title'] ?? 'Workout';
                  final duration = workout['duration'] ?? 'N/A';

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      leading: const Icon(Icons.fitness_center, color: Colors.white, size: 30),
                      title: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Duration: $duration',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            backgroundColor: Colors.grey.shade900,
                            title: Text(
                              title,
                              style: const TextStyle(color: Colors.white),
                            ),
                            content: Text(
                              'This $category workout lasts about $duration.',
                              style: const TextStyle(color: Colors.white70),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
