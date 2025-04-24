part of 'mood_view_bloc.dart';

class MoodViewEvent extends Equatable {
  const MoodViewEvent();
  @override
  List<Object?> get props => [];
}

class ViewUserMoodEvent extends MoodViewEvent {
  const ViewUserMoodEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [id];
}
