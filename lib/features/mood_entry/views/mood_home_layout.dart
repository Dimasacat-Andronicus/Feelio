import 'package:feelio/features/mood_entry/bloc/mood_entry_bloc.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:feelio/shared/helpers.dart/mood_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class MoodHome extends StatefulWidget {
  const MoodHome({super.key});

  @override
  State<MoodHome> createState() => _MoodHomeState();
}

class _MoodHomeState extends State<MoodHome> {
  @override
  void initState() {
    super.initState();
    context.read<MoodEntryBloc>().add(const NavigatePageEvent(page: 'home'));
    context.read<MoodEntryBloc>().add(GetMoodThemeEvent());
    context.read<MoodEntryBloc>().add((GetAllMoodEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodEntryBloc, MoodEntryState>(
      builder: (context, state) {
        final String pageName = MoodHelpers().setAppBarTitle(state.page);
        final Widget pageScreen = MoodHelpers().setScreenBody(state.page);
        final bool isDarkMode = state.isDarkMode;

        return Scaffold(
          appBar: AppBar(
            title: Text(pageName),
            automaticallyImplyLeading: false,
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () async {
                  context.read<MoodEntryBloc>().add(
                    ToggleMoodThemeEvent(isDarkMode: !isDarkMode),
                  );
                },
                icon: Icon(isDarkMode ? Icons.dark_mode_rounded : Icons.sunny),
              ),
            ],
          ),

          bottomNavigationBar: BottomAppBar(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<MoodEntryBloc>().add(
                      const NavigatePageEvent(page: 'home'),
                    );
                  },
                  icon: Icon(Icons.home),
                ),
                IconButton(
                  onPressed: () {
                    context.read<MoodEntryBloc>().add(
                      const NavigatePageEvent(page: 'stats'),
                    );
                  },
                  icon: Icon(Icons.query_stats),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.pushTransition(
                type: PageTransitionType.fade,
                childBuilder: (context) => MoodListPage(),
              );
            },
            tooltip: 'Add New Mood',
            child: const Icon(Icons.add),
          ),
          body:
              state.status.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.status.isError
                  ? Center(child: Text('Error: ${state.errorMessage}'))
                  : state.status.isLoaded
                  ? pageScreen
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
