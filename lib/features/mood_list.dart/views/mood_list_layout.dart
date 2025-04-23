import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/features/mood_list.dart/utils/strings.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_widget.dart';
import 'package:feelio/shared/widgets/journal_container.dart';
import 'package:feelio/shared/widgets/save_button_container.dart';
import 'package:feelio/shared/widgets/text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoodListLayout extends StatelessWidget {
  const MoodListLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(Str().title),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => context.go("/"),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: BlocBuilder<EmojiMoodBloc, EmojiMoodState>(
          builder: (context, state) {
            return Column(
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
            );
          },
        ),
      ),
    );
  }
}
