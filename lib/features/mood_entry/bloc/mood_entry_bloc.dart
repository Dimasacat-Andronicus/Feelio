import 'dart:async';

import 'package:equatable/equatable.dart';
import '../../../utils/mood_enums.dart';
import '../models/mood_model.dart';
import 'package:feelio/utils/mood_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mood_entry_state.dart';
part 'mood_entry_event.dart';

class MoodEntryBloc extends Bloc<MoodEntryEvent, MoodEntryState> {
  final MoodRepository moodRepository;
  StreamSubscription<List<MoodModel>>? _moodSubscription;

  MoodEntryBloc({required this.moodRepository}) : super(const MoodEntryState()) {
    on<MoodEntryEvent>(_onGetAllMoodsEvent);
    on<MoodUpdatedEvent>(_onMoodUpdatedEvent);
  }

  Future<void> _onGetAllMoodsEvent(
      MoodEntryEvent event,
      Emitter<MoodEntryState> emit,
      ) async {
    emit(state.copyWith(status: EmojiMoodStatus.loading));

    await _moodSubscription?.cancel();
    _moodSubscription = moodRepository.getAllMoodStream().listen(
          (moods) {
        add(MoodUpdatedEvent(moods: moods));
      },
    );
  }

  void _onMoodUpdatedEvent(
      MoodUpdatedEvent event,
      Emitter<MoodEntryState> emit,
      ) {
    emit(state.copyWith(
      status: EmojiMoodStatus.loaded,
      moods: event.moods,
    ));
  }

  @override
  Future<void> close() {
    _moodSubscription?.cancel();
    return super.close();
  }
}