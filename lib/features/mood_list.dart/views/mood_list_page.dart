import 'package:feelio/features/mood_list.dart/views/mood_list_layout.dart';
import 'package:feelio/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoodListPage extends StatelessWidget {
  const MoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Str().title),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.goNamed("home"),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: MoodListLayout(),
    );
  }
}
