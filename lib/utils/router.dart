import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/models/user.dart';
import 'package:owwn_coding_challenge/screens/user_detail_page.dart';
import 'package:owwn_coding_challenge/screens/user_list_page.dart';
import 'package:owwn_coding_challenge/screens/login_page.dart';
import 'package:owwn_coding_challenge/screens/start_page.dart';
import 'package:owwn_coding_challenge/utils/constants.dart';

///  Application routing
class AppRouter {
  AppRouter._();

  /// Router naming constants
  static const String start = '/';
  static const String login = '/login';
  static const String users = '/users';
  static const String userDetail = '/userDetail';

  /// Setup [GoRouter] configuration
  static final GoRouter routerConfig = GoRouter(
    navigatorKey: navigatorKey,
    routes: <GoRoute>[
      GoRoute(
        path: start,
        builder: (BuildContext context, GoRouterState state) {
          return const StartPage();
        },
      ),
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: users,
        builder: (BuildContext context, GoRouterState state) {
          return UserListPage();
        },
      ),
      GoRoute(
          path: userDetail,
          builder: (BuildContext context, GoRouterState state) {
            return UserDetailPage(user: state.extra! as Users);
          },
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: UserDetailPage(user: state.extra! as Users),
              transitionDuration: const Duration(
                milliseconds: AppConstants.userHeroTransitionMillis,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) =>
                      FadeTransition(opacity: animation, child: child),
            );
          }),
    ],
  );
}

/// Global navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
