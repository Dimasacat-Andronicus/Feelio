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
        final moodData = await moodRepository.getMoodStats(
          startDate: event.startDate,
          endDate: event.endDate,
        );

        final total = moodData.values.fold(0, (sum, value) => sum + value);
        final moodPercentages = moodData.map(
              (mood, count) => MapEntry(mood, (count / total) * 100),
        );

        emit(
          MoodStatsLoaded(
            moodPercentages: moodPercentages,
            dateRange:
            '${event.startDate.toLocal().toString().split(' ')[0]} to ${event.endDate.toLocal().toString().split(' ')[0]}',
          ),
        );
      } catch (e) {
        emit(MoodStatsError('Failed to load mood stats.'));
      }
    });
  }
}