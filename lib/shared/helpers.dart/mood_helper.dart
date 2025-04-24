import 'package:feelio/features/mood_entry/views/mood_home_list.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:flutter/widgets.dart';

import '../../features/mood_stats/views/mood_stats_page.dart';

class MoodHelpers {
  String getEmojiName(int index) {
    switch (index) {
      case 0:
        return "Happy";
      case 1:
        return 'Sad';
      case 2:
        return 'Angry';
      case 3:
        return 'Nervous';
      case 4:
        return 'Sleepy';
      case 5:
        return 'Curious';
      case 6:
        return 'Overthinking';
      case 7:
        return 'Wow';
      case 8:
        return 'Cool';
      default:
        return 'unknown';
    }
  }

  String getEmojiUrl(String mood) {
    switch (mood) {
      case 'Happy':
        return 'assets/emojis/happy.json';
      case 'Sad':
        return 'assets/emojis/sad.json';
      case 'Angry':
        return 'assets/emojis/angry.json';
      case 'Nervous':
        return 'assets/emojis/nervous.json';
      case 'Sleepy':
        return 'assets/emojis/sleepy.json';
      case 'Curious':
        return 'assets/emojis/curious.json';
      case 'Overthinking':
        return 'assets/emojis/overthinking.json';
      case 'Wow':
        return 'assets/emojis/wow.json';
      default:
        return '';
    }
  }

  String setAppBarTitle(String page) {
    switch (page) {
      case 'home':
        return 'Home Page';
      case 'stats':
        return 'Statistics';
      default:
        return 'Home Page';
    }
  }

  Widget setScreenBody(String page) {
    switch (page) {
      case 'home':
        return const MoodHomeList();
      case 'stats':
        return const MoodStatsPage();
      case 'add-mood':
        return const MoodListPage();
      default:
        return const MoodHomeList();
    }
  }

  final List<Map<String, String>> emojiList = [
    {"name": "happy", "url": "assets/emojis/happy.json"},
    {"name": "sad", "url": "assets/emojis/sad.json"},
    {"name": "angry", "url": "assets/emojis/angry.json"},
    {"name": "nervous", "url": "assets/emojis/nervous.json"},
    {"name": "sleepy", "url": "assets/emojis/sleepy.json"},
    {"name": "curious", "url": "assets/emojis/curious.json"},
    {"name": "overthinking", "url": "assets/emojis/overthinking.json"},
    {"name": "wow", "url": "assets/emojis/wow.json"},
  ];
}
