import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final int day;
  final String category;

  const ExerciseDetailScreen({super.key, required this.day, required this.category});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  int _timer = 30;
  Timer? countdown;
  bool isStarted = false;
  int streak = 0;

  @override
  void initState() {
    super.initState();
    _loadStreak();
  }

  _loadStreak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() => streak = prefs.getInt('streak_${widget.category}') ?? 0);
  }

  _incrementStreak() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int newStreak = (prefs.getInt('streak_${widget.category}') ?? 0) + 1;
    await prefs.setInt('streak_${widget.category}', newStreak);
    setState(() => streak = newStreak);
  }

  void startExercise() {
    setState(() => isStarted = true);
    countdown = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timer == 0) {
        timer.cancel();
        _incrementStreak();
        setState(() {
          isStarted = false;
          _timer = 30;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Exercise Complete!")));
      } else {
        setState(() => _timer--);
      }
    });
  }

  @override
  void dispose() {
    countdown?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String animation = "assets/lottie/${widget.category.toLowerCase()}.json";

    return Scaffold(
      appBar: AppBar(title: Text("Day ${widget.day} - ${widget.category}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: 200, height: 200),
          SizedBox(height: 20),
          Text("Do this exercise for 30 seconds!", style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          isStarted ? Text("$_timer", style: TextStyle(fontSize: 40)) : SizedBox.shrink(),
          ElevatedButton(
            onPressed: isStarted ? null : startExercise,
            child: Text("Start"),
          ),
          SizedBox(height: 20),
          Text("Current Streak: $streak days", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
