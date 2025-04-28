import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/material.dart';

class MoodChips extends StatelessWidget {
  final Map<String, int> moodCounts;

  const MoodChips({super.key, required this.moodCounts});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 8.0,
      children: [
        ...moodCounts.entries.map((entry) {
          return Chip(
            backgroundColor: Mood.values
                .byName(entry.key)
                .emojiColor
                .withAlpha((0.2 * 255).toInt()),
            side: BorderSide.none,
            label: Badge.count(
              count: entry.value,
              child: Image.asset(
                Mood.values.byName(entry.key).imgUrl,
                width: 25,
                height: 25,
              ),
            ),
          );
        }),
      ],
    );
  }
}
