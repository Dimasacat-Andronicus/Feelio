import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feelio/features/mood_entry/bloc/mood_entry_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/date.dart';

import '../../../utils/mood_enums.dart';

class MoodHomeList extends StatelessWidget {
  const MoodHomeList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodEntryBloc, MoodEntryState>(
      builder: (context, state) {
        if (state.status == EmojiMoodStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == EmojiMoodStatus.error) {
          return Center(child: Text('Error: ${state.errorMessage}'));
        } else if (state.status == EmojiMoodStatus.loaded) {
          if (state.moods.isEmpty) {
            return const Center(child: Text('No moods available.'));
          }
          return ListView.builder(
            itemCount: state.moods.length,
            itemBuilder: (context, index) {
              final mood = state.moods[index];
              final date = DateTime.parse(mood.timestamp);

              return GestureDetector(
                onTap: () {
                  context.push('/entry/${mood.id}');
                },
                child: Card(
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
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                mood.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              monthName(date.month),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${date.day}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
