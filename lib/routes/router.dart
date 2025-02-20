import 'package:flutter_template/routes/route_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../shared/logging/logging.dart';
import '../features/homepage/homepage_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: RouteConstants.home,
  observers: [Log.talkerRouteObserver],
  routes: [
    GoRoute(
      path: RouteConstants.talker,
      builder: (context, state) => TalkerScreen(talker: Log.talker),
    ),
    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) => HomepageScreen(),
    ),
    // Add more routes here as needed
  ],
);
