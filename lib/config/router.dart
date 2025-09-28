import 'package:dodamdodam_fe/view/main_pages/home/home.dart';
import 'package:dodamdodam_fe/view/main_pages/main_page.dart';
import 'package:dodamdodam_fe/view/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

GoRouter router(GlobalKey<NavigatorState> navigatorkey) => GoRouter(
  initialLocation: "/",
  navigatorKey: navigatorkey,
  routes: [
    ShellRoute(
      pageBuilder: (context, state, child) =>
          NoTransitionPage(child: OnboardingShell(child: child)),
      routes: [
        GoRoute(
          path: "/",
          name: 'splash',
          builder: (context, state) {
            return Container();
          },
        ),

        GoRoute(
          path: "/login",
          name: 'login',
          builder: (context, state) {
            return Container();
          },
        ),

        GoRoute(
          path: "/join",
          name: 'join',
          builder: (context, state) {
            return Container();
          },
        ),
      ],
    ),

    StatefulShellRoute.indexedStack(
      parentNavigatorKey: navigatorkey,
      builder: (context, state, navigationShell) =>
          MainPageShell(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/some',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: Container()),
            ),
          ],
        ),
      ],
    ),
  ],
);
