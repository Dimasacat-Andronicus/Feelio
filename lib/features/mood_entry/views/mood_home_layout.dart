import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'mood_home_list.dart';

class MoodHome extends StatelessWidget {
  const MoodHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mood Tracker')),
      body: const MoodHomeList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/new');
        },
        tooltip: 'Add New Mood',
        child: const Icon(Icons.add),
      ),
    );
  }
}
