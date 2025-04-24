import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/mood_stats_bloc.dart';
import 'mood_stats_layout.dart';

class MoodStatsPage extends StatelessWidget {
  const MoodStatsPage({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    context.read<MoodStatsBloc>().add(
      FetchMoodStatsEvent(startDate: startOfWeek, endDate: endOfWeek),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(context),
        child: const MoodStatsLayout(),
      ),
    );
  }
}