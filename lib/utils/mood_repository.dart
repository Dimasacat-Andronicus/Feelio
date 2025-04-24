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

  Future<List<MoodModel>> getUserMoodList() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> result = await db.query('mood');
    return result.map((map) => MoodModel.fromMap(map)).toList();
  }
}
