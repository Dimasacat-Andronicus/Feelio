part of 'mood_entry_bloc.dart';

class MoodEntryEvent extends Equatable {
  const MoodEntryEvent();
  @override
  List<Object?> get props => [];
}

class GetAllMoodEvent extends MoodEntryEvent {}

class ToggleMoodThemeEvent extends MoodEntryEvent {
  const ToggleMoodThemeEvent({required this.isDarkMode});
  final bool isDarkMode;
  @override
  List<Object?> get props => [isDarkMode];
}

class GetMoodThemeEvent extends MoodEntryEvent {}

class MoodUpdatedEvent extends MoodEntryEvent {
  final List<MoodModel> moods;
  const MoodUpdatedEvent({required this.moods});
  @override
  List<Object> get props => [moods];
}

class NavigatePageEvent extends MoodEntryEvent {
  const NavigatePageEvent({required this.page});
  final String page;
  @override
  List<Object?> get props => [page];
}
