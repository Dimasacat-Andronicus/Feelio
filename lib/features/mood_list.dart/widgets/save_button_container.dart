import 'package:feelio/features/mood_entry/models/mood_model.dart';
import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/utils/strings.dart';
import 'package:feelio/shared/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      onPressed: () {
        final description = controller.text.toString();

        if (description.isEmpty) {
          showSnackBarMessage(context, Str().addDesc, Colors.red);
        } else {
          final userMood = MoodModel(
            mood: state.emoji,
            description: description,
            timestamp: DateTime.now().toString(),
          );
          context.read<EmojiMoodBloc>().add(AddUserMoodEvent(mood: userMood));
          showSnackBarMessage(context, Str().addSuccess, Colors.green);
          controller.clear();
        }
      },
      child: const Text("Save", style: TextStyle(color: Colors.white)),
    );
  }
}
