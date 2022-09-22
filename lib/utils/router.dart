import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owwn_coding_challenge/screens/login_page.dart';
import 'package:owwn_coding_challenge/screens/start_page.dart';

///  Application routing
class AppRouter {
  AppRouter._();

  /// Router naming constants
  static const String start = '/';
  static const String login = '/login';

  /// Setup [GoRouter] configuration
  static final GoRouter routerConfig = GoRouter(
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
    ],
  );

}