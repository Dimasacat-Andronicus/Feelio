import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:flutter/material.dart';

class TextArea extends StatelessWidget {
  const TextArea({super.key, required this.state, required this.controller});
  final EmojiMoodState state;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TextField(
        controller: controller,
        maxLines: 5,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(),
          ),
          hintText: "Describe your mood...",
          hintStyle: const TextStyle(fontSize: 14.0),
          filled: true, // Background color for better visibility
        ),
      ),
    );
  }
}
