import 'package:feelio/features/mood_entry/views/mood_home_layout.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:feelio/features/mood_view/views/mood_view_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      path: '/add-mood',
      name: "add-mood",
      builder: (BuildContext context, GoRouterState state) {
        return const MoodListPage();
      },
    ),
    GoRoute(
      path: '/view-details/:id',
      name: "view-details",
      builder: (BuildContext context, GoRouterState state) {
        final String? moodId =
            state.pathParameters['id']; // Retrieve ID from path parameters
        return MoodViewPage(moodId: moodId);
      },
    ),
  ],
);

GoRouter get router => _router;
