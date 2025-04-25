import 'package:equatable/equatable.dart';
import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/utils/mood_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mood_list_state.dart';
part 'mood_list_event.dart';

class EmojiMoodBloc extends Bloc<EmojiMoodEvent, EmojiMoodState> {
  final MoodRepository moodRepository;
  EmojiMoodBloc({required this.moodRepository})
    : super(const EmojiMoodState()) {
    on<GetUserMoodEvent>(_onGetUserMoodEvent);
    on<AddUserMoodEvent>(_onAddUserMoodEvent);
  }

  Future<void> _onGetUserMoodEvent(
    GetUserMoodEvent event,
    Emitter<EmojiMoodState> emit,
  ) async {
    final loadingState = state.copyWith(status: EmojiMoodStatus.loading);
    emit(loadingState);

    try {
      // await Future.delayed(const Duration(seconds: 1));
      final loadedState = state.copyWith(status: EmojiMoodStatus.loaded);
      emit(loadedState);

      final emojiName = await moodRepository.getUserMood(event.index);
      final moodListState = state.copyWith(
        status: EmojiMoodStatus.loaded,
        emoji: emojiName,
      );
      emit(moodListState);
    } catch (e) {
      final errorState = state.copyWith(
        status: EmojiMoodStatus.error,
        errorMessage: e.toString(),
      );
      emit(errorState);
    }
  }

  Future<void> _onAddUserMoodEvent(
    AddUserMoodEvent event,
    Emitter<EmojiMoodState> emit,
  ) async {
    final loadingState = state.copyWith(status: EmojiMoodStatus.loading);
    emit(loadingState);

    try {
      final loadedState = state.copyWith(status: EmojiMoodStatus.loaded);
      emit(loadedState);

      final userMood = await moodRepository.addUserMood(event.mood);
      final moodListState = state.copyWith(
        status: EmojiMoodStatus.loaded,
        userMood: userMood,
      );
      emit(moodListState);
    } catch (e) {
      final errorState = state.copyWith(
        status: EmojiMoodStatus.error,
        errorMessage: e.toString(),
      );
      print("Error: $errorState");
      emit(errorState);
    }
  }
}
