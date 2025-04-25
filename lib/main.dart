import 'package:feelio/features/mood_list.dart/bloc/mood_list_bloc.dart';
import 'package:feelio/features/mood_view/bloc/mood_view_bloc.dart';
import 'package:feelio/utils/color_theme.dart';
import 'features/mood_entry/bloc/mood_entry_bloc.dart';
import 'features/mood_stats/bloc/mood_stats_bloc.dart';
import 'package:feelio/utils/mood_repository.dart';
import 'package:feelio/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
          BlocProvider(
            create:
                (context) => MoodViewBloc(
                  moodRepository: context.read<MoodRepository>(),
                ),
          ),

          BlocProvider(
            create:
                (context) => MoodEntryBloc(
                  moodRepository: context.read<MoodRepository>(),
                )..add(GetAllMoodEvent()),
          ),
          BlocProvider(
            create:
                (context) => MoodStatsBloc(
                  moodRepository: RepositoryProvider.of<MoodRepository>(
                    context,
                  ),
                ),
          ),
        ],
        child: BlocBuilder<MoodEntryBloc, MoodEntryState>(
          builder: (context, state) {
            final bool isDarkMode = state.isDarkMode;
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightColorScheme,
                textTheme: GoogleFonts.poppinsTextTheme(),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: darkColorScheme,
                textTheme: GoogleFonts.poppinsTextTheme(),
              ),
              themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
              routerConfig: router,
            );
          },
        ),
      ),
    );
  }
}
