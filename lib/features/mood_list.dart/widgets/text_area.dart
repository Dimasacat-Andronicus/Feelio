import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key, required this.state, required this.controller});
  final EmojiMoodState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Material(
      child: TextField(
        style: TextStyle(fontSize: 14.0, color: colorTheme.primary),
        controller: controller,
        maxLines: 5,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: colorTheme.secondaryContainer),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: colorTheme.secondaryContainer),
          ),
          hintText: "Describe your mood...",

          hintStyle: TextStyle(fontSize: 12.0, color: colorTheme.secondary),
          filled: true,
        ),
      ),
    );
  }
}
