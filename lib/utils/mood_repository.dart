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

  Future<Map<String, Map<String, int>>> getMoodStatsByWeek() async {
    final db = await dbHelper.database;

    final earliestDateResult = await db.rawQuery('''
    SELECT MIN(timestamp) AS earliest_date FROM mood
  ''');
    if (earliestDateResult.isEmpty ||
        earliestDateResult.first['earliest_date'] == null) {
      return {};
    }

    final earliestDate = DateTime.parse(
      earliestDateResult.first['earliest_date'] as String,
    );

    final earliestDateNormalized = DateTime(
      earliestDate.year,
      earliestDate.month,
      earliestDate.day,
    );

    final startOfFirstWeek = earliestDateNormalized.subtract(
      Duration(days: earliestDateNormalized.weekday % 7),
    );

    final result = await db.rawQuery(
      '''
    SELECT
      date(julianday(timestamp) - (julianday(timestamp) - julianday(?)) % 7) AS week_start,
      mood,
      COUNT(*) AS count
    FROM mood
    WHERE timestamp >= ?
    GROUP BY week_start, mood
    ORDER BY week_start DESC
      ''',
      [startOfFirstWeek.toIso8601String(), startOfFirstWeek.toIso8601String()],
    );

    final Map<String, Map<String, int>> weeklyMoodStats = {};
    for (var row in result) {
      final weekStart = row['week_start'] as String;
      final mood = row['mood'] as String;
      final count = row['count'] as int;

      if (!weeklyMoodStats.containsKey(weekStart)) {
        weeklyMoodStats[weekStart] = {};
      }
      weeklyMoodStats[weekStart]![mood] = count;
    }
    return weeklyMoodStats;
  }
}
