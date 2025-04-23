part of 'mood_list_bloc.dart';

extension EmojiMoodStatusX on EmojiMoodStatus {
  bool get isInitial => this == EmojiMoodStatus.initial;
  bool get isLoading => this == EmojiMoodStatus.loading;
  bool get isLoaded => this == EmojiMoodStatus.loaded;
  bool get isError => this == EmojiMoodStatus.error;
  bool get isEmpty => this == EmojiMoodStatus.empty;
  bool get isHappy => this == EmojiMoodStatus.happy;
  bool get isSad => this == EmojiMoodStatus.sad;
  bool get isAngry => this == EmojiMoodStatus.angry;
  bool get isNervous => this == EmojiMoodStatus.nervous;
  bool get isSleepy => this == EmojiMoodStatus.sleepy;
  bool get isCurious => this == EmojiMoodStatus.curious;
  bool get isOverthinking => this == EmojiMoodStatus.overthinking;
  bool get isWow => this == EmojiMoodStatus.wow;
  bool get isCool => this == EmojiMoodStatus.cool;
}

class EmojiMoodState extends Equatable {
  const EmojiMoodState({
    this.status = EmojiMoodStatus.empty,
    this.emoji = '',
    this.description = '',
    this.errorMessage = '',
    this.userMood = const [],
  });
  final EmojiMoodStatus status;
  final String emoji;
  final String description;
  final String errorMessage;
  final List<MoodModel> userMood;

  @override
  List<Object?> get props => [status, emoji, description, userMood];

  EmojiMoodState copyWith({
    EmojiMoodStatus? status,
    String? emoji,
    String? description,
    String? errorMessage,
    List<MoodModel>? userMood,
  }) {
    return EmojiMoodState(
      status: status ?? this.status,
      emoji: emoji ?? this.emoji,
      description: description ?? this.description,
      errorMessage: errorMessage ?? this.errorMessage,
      userMood: userMood ?? this.userMood,
    );
  }
}
