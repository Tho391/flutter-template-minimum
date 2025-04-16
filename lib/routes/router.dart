import 'package:flutter_template/features/homepage/homepage_screen.dart';
import 'package:flutter_template/routes/route_constants.dart';
import 'package:flutter_template/routes/route_observer.dart';
import 'package:flutter_template/shared/logging/logging.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteConstants.home,
  observers: [Log.talkerRouteObserver, routeObserver],
  routes: [
    GoRoute(
      path: RouteConstants.talker,
      builder: (context, state) => TalkerScreen(talker: Log.talker),
    ),
    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) => const HomepageScreen(),
    ),
    // Add more routes here as needed
  ],
  errorBuilder: (context, state) {
    Log.error('GoRouter exception: ${state.error}');

    return const HomepageScreen();
  },
);
