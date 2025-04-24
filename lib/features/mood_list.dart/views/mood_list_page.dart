import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_widget.dart';
import 'package:feelio/features/mood_list.dart/widgets/journal_container.dart';
import 'package:feelio/features/mood_list.dart/widgets/save_button_container.dart';
import 'package:feelio/features/mood_list.dart/widgets/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoodListPage extends StatelessWidget {
  const MoodListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        alignment: Alignment.center,
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
