import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/mood_stats_bloc.dart';
import 'mood_stats_layout.dart';

class MoodStatsPage extends StatelessWidget {
  const MoodStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Statistics'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => context.goNamed("home"),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
      ),
      body: const MoodStatsLayout(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final now = DateTime.now();
          final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
          final endOfWeek = startOfWeek.add(const Duration(days: 6));

          context.read<MoodStatsBloc>().add(
            FetchMoodStatsEvent(startDate: startOfWeek, endDate: endOfWeek),
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
