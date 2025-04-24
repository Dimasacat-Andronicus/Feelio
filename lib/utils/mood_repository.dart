import 'dart:developer';

import 'package:feelio/features/models/mood_model.dart';
import 'package:feelio/utils/database.dart';
import 'package:feelio/shared/helpers.dart/mood_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<List<MoodModel>> getAllListMood() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query('mood');
    return result.map((map) => MoodModel.fromMap(map)).toList();
  }

  Future<bool> setUserTheme(bool isDarkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
    log('Set Dark Mode: $isDarkMode'); // Debugging line
    return isDarkMode;
  }

  Future<bool> getUserTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? theme = prefs.getBool('isDarkMode');
    log('Is Dark Mode: $theme'); // Debugging line
    return theme ?? false;
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
