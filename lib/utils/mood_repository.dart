import 'dart:developer';

import 'package:feelio/features/mood_entry/models/mood_model.dart';
import 'package:feelio/utils/database.dart';
import 'package:feelio/shared/helpers.dart/emoji_name.dart';

class MoodRepository {
  final MoodDatabase dbHelper = MoodDatabase.instance;

  Future<String> getUserMood(int emoji) async {
    final result = MoodHelpers().getEmojiName(emoji);
    return result;
  }

  Future<List<MoodModel>> addUserMood(MoodModel mood) async {
    final db = await dbHelper.database;
    await db.insert('mood', mood.toMap());
    final List<Map<String, dynamic>> result = await db.query('mood');
    log("result: $result");
    return result.map((map) => MoodModel.fromMap(map)).toList();
  }

  Future<List<MoodModel>> viewUserMood(int id) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query(
      'mood',
      where: 'id = ?',
      whereArgs: [id],
    );
    log("result: $result");
    return result.map((map) => MoodModel.fromMap(map)).toList();
  }

  Stream<List<MoodModel>> getAllMoodStream() async* {
    final db = await dbHelper.database;
    yield* Stream.periodic(const Duration(seconds: 1), (_) async {
      final List<Map<String, dynamic>> result = await db.query('mood');
      return result.map((map) => MoodModel.fromMap(map)).toList();
    }).asyncMap((event) async => await event);
  }

  Future<Map<String, int>> getMoodStats({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final db = await dbHelper.database;

    final List<Map<String, dynamic>> result = await db.query(
      'mood',
      columns: ['mood'],
      where: 'timestamp BETWEEN ? AND ?',
      whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
    );

    final Map<String, int> moodCounts = {};
    for (var row in result) {
      final mood = row['mood'] as String;
      moodCounts[mood] = (moodCounts[mood] ?? 0) + 1;
    }

    return moodCounts;
  }


}