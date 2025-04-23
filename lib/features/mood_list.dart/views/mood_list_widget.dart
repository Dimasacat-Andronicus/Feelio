import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/shared/widgets/emoji_carousel.dart';
import 'package:feelio/shared/widgets/error_widget.dart';
import 'package:flutter/material.dart';

class MoodListWidget extends StatelessWidget {
  const MoodListWidget({super.key, required this.state});
  final EmojiMoodState state;

  @override
  Widget build(BuildContext context) {
    return state.status.isLoaded
        ? EmojiCarousel()
        : state.status.isLoading
        ? Center(child: CircularProgressIndicator())
        : state.status.isError
        ? ErrorMoodWidget(errorMessage: state.errorMessage)
        : SizedBox();
  }
}
