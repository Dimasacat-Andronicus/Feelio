import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/utils/date.dart';
import 'package:flutter/material.dart';

class MoodTile extends StatelessWidget {
  const MoodTile({super.key, required this.mood, required this.date});
  final MoodModel mood;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mood.mood,
                    style: TextStyle(
                      fontSize: 18,
                      color: defaultColorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mood.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: defaultColorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  monthName(date.month),
                  style: TextStyle(
                    fontSize: 14,
                    color: defaultColorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${date.day}',
                  style: TextStyle(
                    fontSize: 16,
                    color: defaultColorScheme.tertiary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
