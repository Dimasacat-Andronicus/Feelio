import 'package:feelio/features/mood_entry/widgets/mood_tile.dart';
import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/features/mood_view/views/mood_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feelio/features/mood_entry/bloc/mood_entry_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/mood_model.dart';

class MoodHomeList extends StatefulWidget {
  const MoodHomeList({super.key});

  @override
  State<MoodHomeList> createState() => _MoodHomeListState();
}

class _MoodHomeListState extends State<MoodHomeList> {
  @override
  void initState() {
    super.initState();
    context.read<MoodEntryBloc>().add(GetAllMoodEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodEntryBloc, MoodEntryState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.status.isError) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        }
        if (state.status.isLoaded && state.moods.isEmpty) {
          return const Center(child: Text('No moods available.'));
        }

        final sortedMoods = List<MoodModel>.from(state.moods)
          ..sort((a, b) => DateTime.parse(b.timestamp)
              .compareTo(DateTime.parse(a.timestamp)));

        return ListView.builder(
          itemCount: sortedMoods.length,
          itemBuilder: (context, index) {
            final mood = sortedMoods[index];
            final date = DateTime.parse(mood.timestamp);
            return GestureDetector(
              onTap: () {
                context.pushTransition(
                  type: PageTransitionType.fade,
                  childBuilder:
                      (context) => MoodViewPage(moodId: mood.id.toString()),
                );
                context.read<MoodViewBloc>().add(
                  ViewUserMoodEvent(id: mood.id!),
                );
              },
              child: MoodTile(mood: mood, date: date),
            );
          },
        );
      },
    );
  }
}
