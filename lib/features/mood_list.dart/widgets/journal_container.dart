import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/utils/mood_enums.dart';
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
    final colorTheme = Theme.of(context).colorScheme;

    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Mood.values.byName(state.emoji).description,
            style: TextStyle(fontSize: 12, color: colorTheme.secondary),
          ),
          const SizedBox(height: 15),
          Text(
            state.emoji,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorTheme.primary,
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
