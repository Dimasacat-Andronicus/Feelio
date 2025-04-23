import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/features/mood_list.dart/utils/strings.dart';
import 'package:flutter/material.dart';

class JournalContainer extends StatelessWidget {
  const JournalContainer({
    super.key,
    required this.state,
    required this.controller,
  });
  final EmojiMoodState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(Str().hru, style: TextStyle(fontSize: 16)),
        const SizedBox(height: 15),
        Text(
          state.emoji,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
