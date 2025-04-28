import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/features/mood_view/widgets/emoji_container.dart';
import 'package:feelio/features/mood_view/widgets/journal_view_container.dart';
import 'package:feelio/utils/mood_enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoodViewPage extends StatelessWidget {
  const MoodViewPage({super.key, required this.moodId});
  final String? moodId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodViewBloc, MoodViewState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("View Mood"),
            centerTitle: true,
            backgroundColor:
                Mood.values.byName(state.userMood[0].mood).emojiColor,
            leading: IconButton(
              onPressed: () => context.pushNamed("home"),
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
          ),

          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Mood.values.byName(state.userMood[0].mood).emojiColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                state.status.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.status.isError
                    ? const Center(child: Text("Error loading mood"))
                    : state.status.isLoaded && state.userMood.isNotEmpty
                    ? Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        EmojiContainer(state: state),
                        JournalViewContainer(state: state),
                        const SizedBox(height: 15),
                      ],
                    )
                    : const Center(child: Text("No mood data available")),
          ),
        );
      },
    );
  }
}
