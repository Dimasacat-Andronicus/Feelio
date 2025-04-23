import 'package:feelio/features/mood_list.dart/views/mood_list_layout.dart';
import 'package:flutter/material.dart';

class MoodListPage extends StatelessWidget {
  const MoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Mood"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: MoodListLayout(),
    );
  }
}
