import 'package:equatable/equatable.dart';
import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/utils/mood_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mood_view_event.dart';
part 'mood_view_state.dart';

class MoodViewBloc extends Bloc<MoodViewEvent, MoodViewState> {
  final MoodRepository moodRepository;
  MoodViewBloc({required this.moodRepository}) : super(const MoodViewState()) {
    on<ViewUserMoodEvent>(_onViewUserMoodEvent);
  }

  Future<void> _onViewUserMoodEvent(
    ViewUserMoodEvent event,
    Emitter<MoodViewState> emit,
  ) async {
    try {
      final moods = await moodRepository.viewUserMood(event.id);
      if (moods.isNotEmpty) {
        final userMood = moods.first;
        emit(
          state.copyWith(status: MoodViewStatus.loaded, userMood: [userMood]),
        );
      } else {
        emit(
          state.copyWith(
            status: MoodViewStatus.error,
            errorMessage: "No mood found for this ID.",
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: MoodViewStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
