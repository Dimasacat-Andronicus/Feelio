import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/material.dart';

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
                '${Mood.values.byName(entry.key).emoji}: ${Mood.values.byName(entry.key).name}',
                style: const TextStyle(fontSize: 14),
              ),
              backgroundColor: Mood.values
                  .byName(entry.key)
                  .emojiColor
                  .withAlpha((0.2 * 255).toInt()),
              side: BorderSide.none,
            );
          }).toList(),
    );
  }
}
