import 'package:feelio/features/models/mood_model.dart';
import 'package:flutter/material.dart';

class MoodInfo extends StatelessWidget {
  const MoodInfo({super.key, required this.mood, required this.colorTheme});

  final MoodModel mood;
  final ColorScheme colorTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mood.mood,
          style: TextStyle(
            fontSize: 18,
            color: colorTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          mood.description,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: colorTheme.secondary),
        ),
      ],
    );
  }
}
