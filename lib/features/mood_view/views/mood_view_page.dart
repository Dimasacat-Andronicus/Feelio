import 'package:feelio/features/mood_view/views/mood_view_layout.dart';
import 'package:flutter/material.dart';

class MoodViewPage extends StatelessWidget {
  const MoodViewPage({super.key, required this.moodId});
  final String? moodId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Mood"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: MoodViewLayout(),
    );
  }
}
