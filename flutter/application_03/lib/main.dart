import 'package:flutter/material.dart';

void main() {
  runApp(HomeWorkoutApp());
}

class HomeWorkoutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Workout App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.grey[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    WorkoutsScreen(),
    ProgressScreen(),
    CommunityScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<String> _titles = [
    'Home',
    'Workouts',
    'Progress',
    'Community',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        elevation: 2,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Workouts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

// --- Home Screen ---

class HomeScreen extends StatelessWidget {
  final String userName = "User";

  final Map<String, dynamic> todayWorkout = {
    'title': 'Full Body Stretch',
    'duration': '15 min',
    'exercises': 5,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, $userName!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[700],
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Ready for your home workout?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepPurple[400],
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Today's Workout",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple[800],
            ),
          ),
          SizedBox(height: 12),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Icon(
                    Icons.accessibility_new,
                    size: 64,
                    color: Colors.deepPurple[300],
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todayWorkout['title'],
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple[900],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          '${todayWorkout['duration']} • ${todayWorkout['exercises']} exercises',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.deepPurple[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutDetailScreen(
                            workoutTitle: todayWorkout['title'],
                          ),
                        ),
                      );
                    },
                    child: Text('Start'),
                    style: ElevatedButton.styleFrom(
                      iconColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 32),
          Text(
            'Keep going! Consistency is key to success.',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Colors.deepPurple[600],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Workouts Screen ---

class WorkoutsScreen extends StatelessWidget {
  final List<Workout> workouts = [
    Workout(
      title: 'Full Body Stretch',
      duration: '15 min',
      description:
          'A gentle full body stretch session to increase flexibility and mobility.',
      exercises: [
        Exercise(
            name: 'Neck Stretch',
            duration: '2 min',
            videoUrl: 'https://example.com/videos/neck_stretch.mp4'),
        Exercise(
            name: 'Shoulder Rolls',
            duration: '3 min',
            videoUrl: 'https://example.com/videos/shoulder_rolls.mp4'),
        Exercise(
            name: 'Side Stretch',
            duration: '4 min',
            videoUrl: 'https://example.com/videos/side_stretch.mp4'),
        Exercise(
            name: 'Hamstring Stretch',
            duration: '3 min',
            videoUrl: 'https://example.com/videos/hamstring_stretch.mp4'),
        Exercise(
            name: 'Quad Stretch',
            duration: '3 min',
            videoUrl: 'https://example.com/videos/quad_stretch.mp4'),
      ],
    ),
    Workout(
      title: 'Core Strength',
      duration: '20 min',
      description:
          'Target your core muscles with focused exercises to improve strength and stability.',
      exercises: [
        Exercise(
          name: 'Plank',
          duration: '3 min',
          videoUrl: 'https://example.com/videos/plank.mp4',
        ),
        Exercise(
          name: 'Russian Twists',
          duration: '4 min',
          videoUrl: 'https://example.com/videos/russian_twists.mp4',
        ),
        Exercise(
          name: 'Bicycle Crunches',
          duration: '4 min',
          videoUrl: 'https://example.com/videos/bicycle_crunches.mp4',
        ),
        Exercise(
          name: 'Leg Raises',
          duration: '3 min',
          videoUrl: 'https://example.com/videos/leg_raises.mp4',
        ),
        Exercise(
          name: 'Mountain Climbers',
          duration: '6 min',
          videoUrl: 'https://example.com/videos/mountain_climbers.mp4',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return Card(
          margin: EdgeInsets.only(bottom: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 3,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            title: Text(
              workout.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple[900],
              ),
            ),
            subtitle: Text(
              '${workout.duration} — ${workout.exercises.length} exercises',
              style: TextStyle(
                fontSize: 14,
                color: Colors.deepPurple[500],
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.deepPurple,
              size: 28,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      WorkoutDetailScreen(workout: workout),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class Workout {
  final String title;
  final String duration;
  final String? description;
  final List<Exercise> exercises;

  Workout({
    required this.title,
    required this.duration,
    this.description,
    required this.exercises,
  });
}

class Exercise {
  final String name;
  final String duration;
  final String videoUrl;

  Exercise({
    required this.name,
    required this.duration,
    required this.videoUrl,
  });
}

class WorkoutDetailScreen extends StatelessWidget {
  final Workout? workout;
  final String? workoutTitle;

  const WorkoutDetailScreen({Key? key, this.workout, this.workoutTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayedWorkout = workout ??
        Workout(
            title: workoutTitle ?? 'Workout',
            duration: '',
            exercises: [],
            description: null);

    return Scaffold(
      appBar: AppBar(
        title: Text(displayedWorkout.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: displayedWorkout.exercises.isEmpty
            ? Center(
                child: Text(
                  'No detailed workout info available.',
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple[400]),
                ),
              )
            : ListView(
                children: [
                  if (displayedWorkout.description != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        displayedWorkout.description!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.deepPurple[700],
                        ),
                      ),
                    ),
                  ...displayedWorkout.exercises.map(
                    (exercise) => Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.only(bottom: 12),
                      elevation: 3,
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        leading: Icon(
                          Icons.play_circle_fill,
                          color: Colors.deepPurple,
                          size: 40,
                        ),
                        title: Text(
                          exercise.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple[900],
                          ),
                        ),
                        subtitle: Text(
                          exercise.duration,
                          style: TextStyle(
                            color: Colors.deepPurple[600],
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios,
                            size: 20, color: Colors.deepPurple[300]),
                        // In a complete version, this would open a video player
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text('Video Demo'),
                              content: Text(
                                  'This would play the video for "${exercise.name}".\n\nURL:\n${exercise.videoUrl}'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

// --- Progress Screen ---

class ProgressScreen extends StatelessWidget {
  // Mock user progress data (percentage)
  final double weeklyWorkoutCompletion = 0.75;
  final int totalWorkoutsDone = 18;
  final int totalWorkoutsGoal = 30;
  final int badgesEarned = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            'Your Progress',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[800],
            ),
          ),
          SizedBox(height: 32),
          LinearProgressIndicator(
            value: weeklyWorkoutCompletion,
            minHeight: 16,
            color: Colors.deepPurple,
            backgroundColor: Colors.deepPurple[100],
          ),
          SizedBox(height: 12),
          Text(
            'Weekly Workout Completion: ${(weeklyWorkoutCompletion * 100).toInt()}%',
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple[700],
            ),
          ),
          SizedBox(height: 36),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                Icons.fitness_center,
                color: Colors.deepPurple,
                size: 40,
              ),
              title: Text(
                'Total Workouts',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20, color: Colors.deepPurple[900]),
              ),
              subtitle: Text(
                '$totalWorkoutsDone / $totalWorkoutsGoal completed',
                style: TextStyle(color: Colors.deepPurple[700]),
              ),
            ),
          ),
          SizedBox(height: 20),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            elevation: 3,
            child: ListTile(
              leading: Icon(
                Icons.emoji_events,
                color: Colors.amber[700],
                size: 40,
              ),
              title: Text(
                'Badges Earned',
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 20, color: Colors.deepPurple[900]),
              ),
              subtitle: Row(
                children: List.generate(
                  badgesEarned,
                  (index) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
          Text(
            'Keep pushing your limits! Every workout counts.',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: Colors.deepPurple[600],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Community Screen ---

class CommunityScreen extends StatelessWidget {
  final List<String> posts = [
    'Just completed my first full workout! Feeling great 💪',
    'Anyone else loves the Full Body Stretch routine?',
    'Tips for beginners who struggle with core workouts?',
    'Achievements unlocked! Level 3 badge earned. 🏅',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Community Feed',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple[800],
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: posts.length,
              separatorBuilder: (_, __) => Divider(color: Colors.deepPurple[100]),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepPurple[300],
                    child: Text(
                      'U${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(
                    posts[index],
                    style: TextStyle(color: Colors.deepPurple[900]),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              _showNewPostDialog(context);
            },
            icon: Icon(Icons.add_comment),
            label: Text('Post an Update'),
            style: ElevatedButton.styleFrom(
              iconColor: Colors.deepPurple,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              textStyle: TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  void _showNewPostDialog(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('New Post'),
        content: TextField(
          controller: _controller,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Share your workout experience or tips...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isNotEmpty) {
                  // In a real app, we would post to backend or update state
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Post submitted!'),
                  ));
                  Navigator.pop(context);
                }
              },
              child: Text('Post')),
        ],
      ),
    );
  }
}
