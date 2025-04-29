part of 'mood_list_bloc.dart';

enum EmojiMoodStatus { initial, loading, loaded, error, empty }

extension EmojiMoodStatusX on EmojiMoodStatus {
  bool get isInitial => this == EmojiMoodStatus.initial;
  bool get isLoading => this == EmojiMoodStatus.loading;
  bool get isLoaded => this == EmojiMoodStatus.loaded;
  bool get isError => this == EmojiMoodStatus.error;
  bool get isEmpty => this == EmojiMoodStatus.empty;
}

class EmojiMoodState extends Equatable {
  const EmojiMoodState({
    this.status = EmojiMoodStatus.empty,
    this.errorMessage = '',
    this.emoji = 'sad',
    this.userMood = const [],
  });
  final EmojiMoodStatus status;
  final String errorMessage;
  final String emoji;
  final List<MoodModel> userMood;

  @override
  List<Object?> get props => [status, emoji, errorMessage, userMood];

  EmojiMoodState copyWith({
    EmojiMoodStatus? status,
    String? errorMessage,
    String? emoji,
    List<MoodModel>? userMood,
  }) {
    return EmojiMoodState(
      status: status ?? this.status,
      emoji: emoji ?? this.emoji,
      errorMessage: errorMessage ?? this.errorMessage,
      userMood: userMood ?? this.userMood,
    );
  }
}
