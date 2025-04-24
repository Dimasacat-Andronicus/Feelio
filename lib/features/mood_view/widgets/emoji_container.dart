import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/shared/helpers.dart/mood_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmojiContainer extends StatelessWidget {
  const EmojiContainer({super.key, required this.state});
  final MoodViewState state;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mood =
        state.userMood.map((e) => e.toMap()).toList();
    final String moodText = mood.first['mood'];
    final String moodUrl = MoodHelpers().getEmojiUrl(moodText);
    return Column(
      children: [
        LottieBuilder.asset(
          moodUrl,
          fit: BoxFit.fill,
          width: double.infinity,
          animate: true,
        ),
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              moodText,
              maxLines: 10,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
