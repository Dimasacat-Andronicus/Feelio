import 'package:feelio/features/mood_entry/views/mood_home_layout.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:feelio/features/mood_view/mood_view_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/mood_stats/views/mood_stats_page.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
     GoRoute(
       path: '/',
       name: 'home',
       builder: (BuildContext context, state) {
         return const MoodHome();
       },
     ),
    GoRoute(
      path: '/new',
      name: "new",
      builder: (BuildContext context, GoRouterState state) {
        return const MoodListPage();
      },
    ),
    GoRoute(
      path: '/view-details',
      name: "view-details",
      builder: (BuildContext context, GoRouterState state) {
        return const MoodViewPage();
      },
    ),
    GoRoute(
      path: '/stats',
      name: "stats",
      builder: (BuildContext context, GoRouterState state) {
        return const MoodStatsPage();
      },
    ),
  ],
);

GoRouter get router => _router;
