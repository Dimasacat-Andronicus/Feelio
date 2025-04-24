import 'package:feelio/features/mood_list.dart/views/mood_list_layout.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:feelio/features/mood_view/mood_view_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    // GoRoute(
    //   path: '/',
    //   builder: (BuildContext context, state) {
    //     return const MoodHome();
    //   },
    // ),
    GoRoute(
      path: '/',
      name: "home",
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
  ],
);

GoRouter get router => _router;
