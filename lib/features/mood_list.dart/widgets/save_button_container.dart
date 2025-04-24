import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/shared/widgets/button_widget.dart';
import 'package:feelio/utils/strings.dart';
import 'package:feelio/shared/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SaveButtonContainer extends StatelessWidget {
  const SaveButtonContainer({
    super.key,
    required this.controller,
    required this.state,
  });
  final TextEditingController controller;
  final EmojiMoodState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          text: "Save",
          backgroundColor: Colors.blue,
          onPressed: () {
            final description = controller.text;

            if (description.isEmpty || description == "") {
              showSnackBarMessage(context, Str().addDesc, Colors.red);
              print("Description is empty: $description");
            } else {
              final userMood = MoodModel(
                mood: state.emoji,
                description: description,
                timestamp: DateTime.now().toString(),
              );
              context.read<EmojiMoodBloc>().add(
                AddUserMoodEvent(mood: userMood),
              );
              showSnackBarMessage(context, Str().addSuccess, Colors.green);
              context.pushNamed("home");
              controller.clear();
            }
          },
        ),
        SizedBox(height: 10),
        ButtonWidget(
          text: "Cancel",
          backgroundColor: Colors.red,
          onPressed: () => context.pushNamed("home"),
        ),
      ],
    );
  }
}
