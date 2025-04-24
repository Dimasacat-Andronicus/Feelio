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
  final Map<String, double> moodPercentages;
  final String dateRange;

  const MoodStatsLoaded({
    required this.moodPercentages,
    required this.dateRange,
  });

  @override
  bool get isSuccess => true;

  @override
  List<Object> get props => [moodPercentages, dateRange];
}

class MoodStatsError extends MoodStatsState {
  final String message;

  const MoodStatsError(this.message);

  @override
  bool get isError => true;

  @override
  List<Object> get props => [message];
}
