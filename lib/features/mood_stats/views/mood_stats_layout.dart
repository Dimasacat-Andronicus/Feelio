import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../shared/helpers.dart/emoji_returner.dart';
import '../../../shared/helpers.dart/mood_color.dart';
import '../bloc/mood_stats_bloc.dart';

class MoodStatsLayout extends StatelessWidget {
  const MoodStatsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    context.read<MoodStatsBloc>().add(
      FetchMoodStatsEvent(startDate: startOfWeek, endDate: endOfWeek),
    );

    return BlocBuilder<MoodStatsBloc, MoodStatsState>(
      builder: (context, state) {
        if (state is MoodStatsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MoodStatsLoaded) {
          final moodPercentages = state.moodPercentages;
          final dateRange = state.dateRange;

          if (moodPercentages.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          final weeksData = [
            {'dateRange': dateRange, 'moodPercentages': moodPercentages},
          ];

          return ListView.builder(
            itemCount: weeksData.length,
            itemBuilder: (context, index) {
              final week = weeksData[index];
              final isCurrentWeek = index == 0;

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: isCurrentWeek ? 8 : 4,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        week['dateRange'] as String,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                              isCurrentWeek
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 200,
                        child: PieChart(
                          PieChartData(
                            startDegreeOffset: -90,
                            sectionsSpace: 2,
                            centerSpaceRadius: 0,
                            sections:
                                (week['moodPercentages'] as Map<String, double>)
                                    .entries
                                    .map((entry) {
                                      return PieChartSectionData(
                                        value: entry.value.toDouble(),
                                        title:
                                            '${getMoodEmoji(entry.key)}\n${entry.value.toStringAsFixed(1)}%',
                                        color: getMoodColor(entry.key),
                                        radius: 105,
                                        titleStyle: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        titlePositionPercentageOffset: 0.6,
                                      );
                                    })
                                    .toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is MoodStatsError) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text('No data available.'));
      },
    );
  }
}
