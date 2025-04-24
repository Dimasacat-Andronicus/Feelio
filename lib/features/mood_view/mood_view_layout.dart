import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/features/mood_view/widgets/emoji_container.dart';
import 'package:feelio/features/mood_view/widgets/journal_view_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodViewLayout extends StatefulWidget {
  const MoodViewLayout({super.key});

  @override
  State<MoodViewLayout> createState() => _MoodViewLayoutState();
}

class _MoodViewLayoutState extends State<MoodViewLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: BlocBuilder<MoodViewBloc, MoodViewState>(
        builder: (context, state) {
          return state.status.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.status.isError
              ? const Center(child: Text("Error loading mood"))
              : state.status.isLoaded
              ? SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    EmojiContainer(state: state),
                    JournalViewContainer(),
                    const SizedBox(height: 15),
                  ],
                ),
              )
              : SizedBox();
        },
      ),
    );
  }
}
