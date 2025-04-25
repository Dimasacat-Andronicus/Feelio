import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/material.dart';

class EmojiContainer extends StatelessWidget {
  const EmojiContainer({super.key, required this.state});
  final MoodViewState state;

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final List<Map<String, dynamic>> mood =
        state.userMood.map((e) => e.toMap()).toList();
    final String moodText = mood.first['mood'];
    final String moodUrl = Mood.values.byName(moodText.toLowerCase()).imgUrl;
    return Column(
      children: [
        Image.asset(moodUrl, fit: BoxFit.fill, width: double.infinity),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            moodText,
            maxLines: 10,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorTheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
