part of 'mood_entry_bloc.dart';

enum EmojiMoodStatus { initial, loading, loaded, error }

extension EmojiMoodStatusX on EmojiMoodStatus {
  bool get isInitial => this == EmojiMoodStatus.initial;
  bool get isLoading => this == EmojiMoodStatus.loading;
  bool get isLoaded => this == EmojiMoodStatus.loaded;
  bool get isError => this == EmojiMoodStatus.error;
}

class MoodEntryState extends Equatable {
  const MoodEntryState({
    this.status = EmojiMoodStatus.initial,
    this.moods = const [],
    this.page = '',
    this.isDarkMode = false,
    this.errorMessage = '',
  });

  final EmojiMoodStatus status;
  final List<MoodModel> moods;
  final String page;
  final bool isDarkMode;
  final String errorMessage;

  @override
  List<Object?> get props => [status, moods, page, isDarkMode, errorMessage];

  MoodEntryState copyWith({
    EmojiMoodStatus? status,
    List<MoodModel>? moods,
    String? page,
    bool? isDarkMode,
    String? errorMessage,
  }) {
    return MoodEntryState(
      status: status ?? this.status,
      moods: moods ?? this.moods,
      page: page ?? this.page,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
