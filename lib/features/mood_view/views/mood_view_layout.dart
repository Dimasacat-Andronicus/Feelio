import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/features/mood_view/widgets/emoji_container.dart';
import 'package:feelio/features/mood_view/widgets/journal_view_container.dart';
import 'package:feelio/shared/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MoodViewLayout extends StatelessWidget {
  const MoodViewLayout({super.key});

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
                    JournalViewContainer(state: state),
                    const SizedBox(height: 15),
                    ButtonWidget(
                      text: "Cancel",
                      backgroundColor: Colors.red,
                      onPressed: () {
                        context.pushNamed("home");
                      },
                    ),
                  ],
                ),
              )
              : SizedBox();
        },
      ),
    );
  }
}
