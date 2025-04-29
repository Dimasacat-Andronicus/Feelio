import 'package:feelio/features/mood_entry/views/mood_home_list.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:feelio/features/mood_stats/views/mood_stats_page.dart';
import 'package:flutter/widgets.dart';

class MoodHelpers {
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
}
