part of 'mood_stats_bloc.dart';

abstract class MoodStatsState extends Equatable {
  const MoodStatsState();

  bool get isSuccess => false;
  bool get isError => false;
  bool get initialState => false;

  @override
  List<Object> get props => [];
}

class MoodStatsInitial extends MoodStatsState {
  @override
  bool get initialState => true;
}

class MoodStatsLoading extends MoodStatsState {}

class MoodStatsLoaded extends MoodStatsState {
  final List<Map<String, double>> weeklyMoodPercentages;
  final List<Map<String, int>> weeklyMoodCounts; // Add this
  final List<String> dateRanges;

  const MoodStatsLoaded({
    required this.weeklyMoodPercentages,
    required this.weeklyMoodCounts, // Add this
    required this.dateRanges,
  });

  @override
  bool get isSuccess => true;

  @override
  List<Object> get props => [weeklyMoodPercentages, weeklyMoodCounts, dateRanges];
}

class MoodStatsError extends MoodStatsState {
  final String message;

  const MoodStatsError(this.message);

  @override
  bool get isError => true;

  @override
  List<Object> get props => [message];
}
