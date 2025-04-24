import 'package:feelio/features/mood_entry/bloc/mood_entry_bloc.dart';
import 'package:feelio/shared/helpers.dart/mood_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodEntryBloc, MoodEntryState>(
      builder: (context, state) {
        final String pageName = MoodHelpers().setAppBarTitle(state.page);
        final Widget pageScreen = MoodHelpers().setScreenBody(state.page);
        return Scaffold(
          appBar: AppBar(
            title: Text(pageName),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            surfaceTintColor: Colors.white,
          ),
          bottomNavigationBar: BottomAppBar(
            height: 80,
            shape: CircularNotchedRectangle(),
            notchMargin: 6,
            color: Colors.grey[800],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    context.read<MoodEntryBloc>().add(
                      const NavigatePageEvent(page: 'home'),
                    );
                  },
                  icon: Icon(Icons.home, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {
                    context.read<MoodEntryBloc>().add(
                      const NavigatePageEvent(page: 'stats'),
                    );
                  },
                  icon: Icon(Icons.query_stats, color: Colors.white),
                ),
              ],
            ),
          ),
          body:
              state.status.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : state.status.isError
                  ? Center(child: Text('Error: ${state.errorMessage}'))
                  : state.status.isLoaded
                  ? pageScreen
                  : const Center(child: CircularProgressIndicator()),

          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[800],
            foregroundColor: Colors.white,
            onPressed: () {
              context.pushNamed('add-mood');
            },
            tooltip: 'Add New Mood',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
