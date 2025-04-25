import 'package:flutter/material.dart';
import '../../../shared/helpers.dart/emoji_returner.dart';
import '../../../shared/helpers.dart/mood_color.dart';

class MoodChips extends StatelessWidget {
  final Map<String, int> moodCounts;

  const MoodChips({super.key, required this.moodCounts});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children:
          moodCounts.entries.map((entry) {
            return Chip(
              label: Text(
                '${getMoodEmoji(entry.key)}: ${entry.value}',
                style: const TextStyle(fontSize: 14),
              ),
              backgroundColor: getMoodColor(
                entry.key,
              ).withAlpha((0.2 * 255).toInt()),
              side: BorderSide.none,
            );
          }).toList(),
    );
  }
}
