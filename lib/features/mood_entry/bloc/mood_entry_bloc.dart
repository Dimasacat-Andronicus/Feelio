import 'dart:async';

import 'package:equatable/equatable.dart';
import '../../models/mood_model.dart';
import 'package:feelio/utils/mood_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mood_entry_state.dart';
part 'mood_entry_event.dart';

class MoodEntryBloc extends Bloc<MoodEntryEvent, MoodEntryState> {
  final MoodRepository moodRepository;
  StreamSubscription<List<MoodModel>>? _moodSubscription;

  MoodEntryBloc({required this.moodRepository})
    : super(const MoodEntryState()) {
    on<GetAllMoodEvent>(_onGetAllMoodsEvent);
    on<NavigatePageEvent>(_onNavigatePageEvent);
    on<ToggleMoodThemeEvent>(_onToggleMoodThemeEvent);
    on<GetMoodThemeEvent>(_onGetMoodThemeEvent);
  }

  Future<void> _onGetAllMoodsEvent(
    GetAllMoodEvent event,
    Emitter<MoodEntryState> emit,
  ) async {
    final loadingState = state.copyWith(status: EmojiMoodStatus.loading);
    emit(loadingState);

    try {
      final moods = await moodRepository.getAllListMood();

      final loadedState = loadingState.copyWith(
        status: EmojiMoodStatus.loaded,
        moods: moods,
      );
      emit(loadedState);
    } catch (e) {
      final errorState = loadingState.copyWith(
        status: EmojiMoodStatus.error,
        errorMessage: e.toString(),
      );
      emit(errorState);
    }
  }

  Future<void> _onNavigatePageEvent(
    NavigatePageEvent event,
    Emitter<MoodEntryState> emit,
  ) async {
    final loadingState = state.copyWith(status: EmojiMoodStatus.loading);
    emit(loadingState);
    try {
      // await Future.delayed(const Duration(seconds: 1));
      final loadedState = loadingState.copyWith(
        status: EmojiMoodStatus.loaded,
        page: event.page,
      );
      emit(loadedState);
    } catch (e) {
      final errorState = loadingState.copyWith(
        status: EmojiMoodStatus.error,
        errorMessage: e.toString(),
      );
      emit(errorState);
    }
  }

  Future<void> _onToggleMoodThemeEvent(
    ToggleMoodThemeEvent event,
    Emitter<MoodEntryState> emit,
  ) async {
    final loadingState = state.copyWith(status: EmojiMoodStatus.loading);
    emit(loadingState);

    try {
      final setTheme = await moodRepository.setUserTheme(event.isDarkMode);
      final themeState = loadingState.copyWith(
        status: EmojiMoodStatus.loaded,
        isDarkMode: setTheme,
      );
      emit(themeState);
    } catch (e) {
      final errorState = loadingState.copyWith(
        status: EmojiMoodStatus.error,
        errorMessage: e.toString(),
      );
      emit(errorState);
    }
  }

  Future<void> _onGetMoodThemeEvent(
    GetMoodThemeEvent event,
    Emitter<MoodEntryState> emit,
  ) async {
    final loadingState = state.copyWith(status: EmojiMoodStatus.loading);
    emit(loadingState);

    try {
      final getTheme = await moodRepository.getUserTheme();
      final themeState = loadingState.copyWith(
        status: EmojiMoodStatus.loaded,
        isDarkMode: getTheme,
      );
      emit(themeState);
    } catch (e) {
      final errorState = loadingState.copyWith(
        status: EmojiMoodStatus.error,
        errorMessage: e.toString(),
      );
      emit(errorState);
    }
  }

  @override
  Future<void> close() {
    _moodSubscription?.cancel();
    return super.close();
  }
}
