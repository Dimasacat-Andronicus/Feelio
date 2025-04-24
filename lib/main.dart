import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/utils/mood_repository.dart';
import 'package:feelio/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/mood_entry/bloc/mood_entry_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MoodRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (context) => EmojiMoodBloc(
                  moodRepository: context.read<MoodRepository>(),
                )..add(GetUserMoodEvent(index: 0)),
          ),
          BlocProvider<MoodEntryBloc>(
            create:
                (context) => MoodEntryBloc(
                  moodRepository: MoodRepository(),
                )..add(MoodEntryEvent())
          ),
        ],
        child: MaterialApp.router(
          title: 'Feelio',
          theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
          routerConfig: router,
        ),
      ),
    );
  }
}
