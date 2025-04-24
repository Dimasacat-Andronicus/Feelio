part of 'mood_entry_bloc.dart';

class MoodEntryEvent extends Equatable {
  const MoodEntryEvent();

  @override
  List<Object?> get props => [];
}

class MoodUpdatedEvent extends MoodEntryEvent {
  final List<MoodModel> moods;

  const MoodUpdatedEvent({required this.moods});

  @override
  List<Object> get props => [moods];
}
