part of 'mood_list_bloc.dart';

class EmojiMoodEvent extends Equatable {
  const EmojiMoodEvent();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetUserMoodEvent extends EmojiMoodEvent {
  const GetUserMoodEvent({required this.index});
  final int index;
  @override
  List<Object?> get props => [index];
}

class AddUserMoodEvent extends EmojiMoodEvent {
  const AddUserMoodEvent({required this.mood});

  final MoodModel mood;
  @override
  List<Object?> get props => [
    [mood],
  ];
}
