import 'package:dodamdodam_fe/view/main_pages/book_store/book_store.dart';
import 'package:dodamdodam_fe/view/main_pages/community/community.dart';
import 'package:dodamdodam_fe/view/main_pages/home/home.dart';
import 'package:dodamdodam_fe/view/main_pages/main_page.dart';
import 'package:dodamdodam_fe/view/main_pages/profile/profile.dart';
import 'package:dodamdodam_fe/view/onboarding/join.dart';
import 'package:dodamdodam_fe/view/onboarding/login.dart';
import 'package:dodamdodam_fe/view/onboarding/onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

GoRouter router(GlobalKey<NavigatorState> navigatorkey) => GoRouter(
  initialLocation: "/home", // 시작 화면 지정
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
            return LoginPage();
          },
        ),

        GoRoute(
          path: "/join",
          name: 'join',
          builder: (context, state) {
            return JoinPage();
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
              path: '/home',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: HomePage()),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/community',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: CommunityPage()),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/book_store',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: BookStorePage()),
            ),
          ],
        ),

        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: ProfilePage()),
            ),
          ],
        ),
      ],
    ),
  ],
);
