import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../utils/mood_repository.dart';

part 'mood_stats_event.dart';

part 'mood_stats_state.dart';

class MoodStatsBloc extends Bloc<MoodStatsEvent, MoodStatsState> {
  final MoodRepository moodRepository;

  MoodStatsBloc({required this.moodRepository}) : super(MoodStatsInitial()) {
    on<FetchMoodStatsEvent>((event, emit) async {
      emit(MoodStatsLoading());
      try {
        final weeklyMoodStats = await moodRepository.getMoodStatsByWeek();

        final weeklyMoodPercentages = <Map<String, double>>[];
        final weeklyMoodCounts = <Map<String, int>>[];
        final dateRanges = <String>[];

        weeklyMoodStats.forEach((weekStart, moodCounts) {
          final startDate = DateTime.parse(weekStart);
          final endDate = startDate.add(const Duration(days: 6));
          final formattedRange =
              '${startDate.toLocal().toString().split(' ')[0]} to ${endDate.toLocal().toString().split(' ')[0]}';

          final total = moodCounts.values.fold(0, (sum, count) => sum + count);
          final percentages = moodCounts.map(
                (mood, count) => MapEntry(mood, (count / total) * 100),
          );

          weeklyMoodPercentages.add(percentages);
          weeklyMoodCounts.add(moodCounts); // Add raw counts
          dateRanges.add(formattedRange);
        });

        emit(
          MoodStatsLoaded(
            weeklyMoodPercentages: weeklyMoodPercentages,
            weeklyMoodCounts: weeklyMoodCounts,
            dateRanges: dateRanges,
          ),
        );
      } catch (e) {
        emit(MoodStatsError('Failed to load mood stats.'));
      }
    });
  }
}