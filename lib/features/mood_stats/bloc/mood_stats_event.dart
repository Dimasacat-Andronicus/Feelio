part of 'mood_stats_bloc.dart';

abstract class MoodStatsEvent extends Equatable {
  const MoodStatsEvent();

  @override
  List<Object> get props => [];
}

class FetchMoodStatsEvent extends MoodStatsEvent {
  final DateTime startDate;
  final DateTime endDate;

  const FetchMoodStatsEvent({required this.startDate, required this.endDate});

  @override
  List<Object> get props => [startDate, endDate];
}
