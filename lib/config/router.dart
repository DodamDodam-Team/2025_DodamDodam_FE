import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

GoRouter router(GlobalKey<NavigatorState> navigatorkey) => GoRouter(
  initialLocation: "/",
  navigatorKey: navigatorkey,
  routes: [
    GoRoute(
      path: "/",
      name: 'init',
      builder: (context, state) => /*const*/ Container(),
    ),

    /**StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavKey,
        builder: (context, state, navigationShell) =>
            SomePage(navigationShell: navigationShell),
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/step1',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ResearchPageStep1()),
              ),
            ],
          ),
        ],
      ),
   */
  ],
);
