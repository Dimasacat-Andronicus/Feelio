import 'package:feelio/features/mood_view/mood_view_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoodViewPage extends StatelessWidget {
  const MoodViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Mood"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            context.goNamed("home");
          },
        ),
      ),
      body: MoodViewLayout(),
    );
  }
}
