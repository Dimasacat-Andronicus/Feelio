import 'dart:math';

import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_widget.dart';
import 'package:feelio/features/mood_list.dart/widgets/journal_container.dart';
import 'package:feelio/features/mood_list.dart/widgets/save_button_container.dart';
import 'package:feelio/features/mood_list.dart/widgets/text_area.dart';
import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoodListLayout extends StatelessWidget {
  const MoodListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: BlocBuilder<EmojiMoodBloc, EmojiMoodState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                MoodListWidget(state: state),
                JournalContainer(
                  state: state,
                  controller: descriptionController,
                ),
                TextArea(controller: descriptionController, state: state),
                const SizedBox(height: 15),
                SaveButtonContainer(
                  controller: descriptionController,
                  state: state,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<MoodViewBloc>().add(
                      const ViewUserMoodEvent(id: 20),
                    );
                    debugPrint("View Mood Button Pressed");
                    context.pushNamed(
                      "view-details",
                      queryParameters: {"id": "20"},
                    );
                  },
                  child: const Text("View Mood"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
