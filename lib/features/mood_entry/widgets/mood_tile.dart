import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/features/mood_entry/widgets/date_info.dart';
import 'package:feelio/features/mood_entry/widgets/mood_icon.dart';
import 'package:feelio/features/mood_entry/widgets/mood_info.dart';
import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/material.dart';

class MoodTile extends StatelessWidget {
  const MoodTile({super.key, required this.mood, required this.date});

  final MoodModel mood;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;

    return Card(
      color: colorTheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Mood.values.byName(mood.mood).emojiColor,
          width: 1.5,
        ),
      ),
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MoodIcon(mood: mood), // Extracted widget
            const SizedBox(width: 12),
            Expanded(
              child: MoodInfo(mood: mood, colorTheme: colorTheme),
            ), // Extracted widget
            DateInfo(date: date, colorTheme: colorTheme), // Extracted widget
          ],
        ),
      ),
    );
  }
}
