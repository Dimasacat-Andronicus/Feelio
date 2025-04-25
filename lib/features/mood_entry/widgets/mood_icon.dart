import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/widgets.dart';

class MoodIcon extends StatelessWidget {
  const MoodIcon({super.key, required this.mood});

  final MoodModel mood;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Mood.values.byName(mood.mood.toLowerCase()).imgUrl,
      width: 50,
      height: 50,
      fit: BoxFit.contain,
    );
  }
}
