part of 'mood_view_bloc.dart';

enum MoodViewStatus { initial, loading, loaded, error }

extension MoodViewStatusX on MoodViewStatus {
  bool get isInitial => this == MoodViewStatus.initial;
  bool get isLoading => this == MoodViewStatus.loading;
  bool get isLoaded => this == MoodViewStatus.loaded;
  bool get isError => this == MoodViewStatus.error;
}

class MoodViewState extends Equatable {
  const MoodViewState({
    this.status = MoodViewStatus.initial,
    this.userMood = const [],
    this.errorMessage = '',
  });
  final MoodViewStatus status;
  final List<MoodModel> userMood;
  final String errorMessage;

  @override
  List<Object?> get props => [status, userMood, errorMessage];

  MoodViewState copyWith({
    MoodViewStatus? status,
    List<MoodModel>? userMood,
    String? errorMessage,
  }) {
    return MoodViewState(
      status: status ?? this.status,
      userMood: userMood ?? this.userMood,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
