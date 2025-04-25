import 'package:feelio/features/mood_entry/views/mood_home_layout.dart';
import 'package:feelio/features/mood_landing/views/landing_screen.dart';
import 'package:feelio/features/mood_list.dart/views/mood_list_page.dart';
import 'package:feelio/features/mood_view/views/mood_view_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/mood_stats/views/mood_stats_page.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'landing',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const MoodHome(),
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const MoodHome(),
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.easeInOut;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          ),
    ),

    GoRoute(
      path: '/add-mood',
      name: "add-mood",
      builder: (context, state) => const MoodListPage(),
    ),
    GoRoute(
      path: '/view-details/:id',
      name: "view-details",
      builder: (BuildContext context, GoRouterState state) {
        final String? moodId = state.pathParameters['id'];
        return MoodViewPage(moodId: moodId);
      },
    ),
    GoRoute(
      path: '/stats',
      name: "stats",
      builder:
          (BuildContext context, GoRouterState state) => const MoodStatsPage(),
    ),
  ],
);

GoRouter get router => _router;
