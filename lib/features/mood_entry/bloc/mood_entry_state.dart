part of 'mood_entry_bloc.dart';

class MoodEntryState extends Equatable {
  const MoodEntryState({
    this.status = EmojiMoodStatus.initial,
    this.moods = const [],
    this.errorMessage = '',
  });

  final EmojiMoodStatus status;
  final List<MoodModel> moods;
  final String errorMessage;

  @override
  List<Object?> get props => [status, moods, errorMessage];

  MoodEntryState copyWith({
    EmojiMoodStatus? status,
    List<MoodModel>? moods,
    String? errorMessage,
  }) {
    return MoodEntryState(
      status: status ?? this.status,
      moods: moods ?? this.moods,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
