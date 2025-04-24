import 'dart:math';

import 'package:feelio/features/mood_entry/models/mood_model.dart';
import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmojiContainer extends StatelessWidget {
  const EmojiContainer({super.key, required this.state});
  final MoodViewState state;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mood =
        state.userMood.map((e) => e.toMap()).toList();
    return Card(
      child: Column(
        children: [
          LottieBuilder.asset(
            'assets/emojis/happy.json',
            fit: BoxFit.fill,
            width: double.infinity,
            animate: false,
          ),
          Text(
            mood.first['description'],
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
