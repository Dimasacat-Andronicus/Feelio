import 'package:feelio/features/mood_entry/widgets/mood_tile.dart';
import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feelio/features/mood_entry/bloc/mood_entry_bloc.dart';
import 'package:go_router/go_router.dart';

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
        return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: state.moods.length,
            itemBuilder: (context, index) {
              final mood = state.moods[index];
              final date = DateTime.parse(mood.timestamp);
              return GestureDetector(
                onTap:
                    () => {
                      context.push('/view-details/${mood.id}'),
                      context.read<MoodViewBloc>().add(
                        ViewUserMoodEvent(id: mood.id!),
                      ),
                    },
                child: MoodTile(mood: mood, date: date),
              );
            },
          ),
        );
      },
    );
  }
}
