import 'package:feelio/features/mood_list.dart/views/mood_list_layout.dart';
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
      builder: (BuildContext context, GoRouterState state) {
        return const MoodListLayout();
      },
    ),
  ],
);

GoRouter get router => _router;
