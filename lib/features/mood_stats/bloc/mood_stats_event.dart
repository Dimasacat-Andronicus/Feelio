part of 'mood_stats_bloc.dart';

abstract class MoodStatsEvent extends Equatable {
  const MoodStatsEvent();

  @override
  List<Object> get props => [];
}

class FetchMoodStatsEvent extends MoodStatsEvent {}
